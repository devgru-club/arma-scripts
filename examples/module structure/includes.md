`#include "childFolder\someFile.sqf"` seems like the logical commands to preprocess all of those pesky config files that make your missions so dynamic, but it's not. Thanks to kzk, now I know:

> "As far as I know you can only use includes from the same directory or child directories. You cannot access parent directory even if you use full path. The preprocessor does not start looking from mission directory, it starts in the directory you call include from."

Long story short, I spent the better part of last night attempting to troubleshoot something that I just assumed would function from the project root (like everything else). Essentially, my project folder was setup as follows:

```sqf
pools\vehicles\cars.sqf
pools\vehicles\[...].sqf
pools\vehicles\tanks.sqf
functions\generateVehicle.sqf // can't use #include "\pools\vehicles\cars.sqf"
```

`#include` is limited to the directory that the command is currently being called from, or children of that directory. In other words: Big trouble for anyone who wants their directory structure to make any sense at all.

Low and behold there is a way to access folders in directories outside of the current one, but not with `#include`. Instead, kzk suggests using `compile preprocessFileLineNumbers, along with a global variable for the [site root](http://killzonekid.com/arma-scripting-tutorials-mission-root/):

> "You can use call compile preprocessFileLineNumbers, it is relative to your mission directory and will preprocess your file. The file doesn't even have to end in .sqf"

And the global variable:

```sqf
MISSION_ROOT = call {
  private "_arr";
  _arr = toArray str missionConfigFile;
  _arr resize (count _arr - 15);
  toString _arr;
};
```
