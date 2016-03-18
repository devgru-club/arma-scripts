The following are useful snippets of sqf code relating to waypoint creation and management.

```sqf
// play animation on unit; gear not modified
[_unit, "KNEEL", "ASIS"] call BIS_fnc_ambientAnim;

// play animation on unit; gear randomized
[_unit, "KNEEL"] call BIS_fnc_ambientAnim;
