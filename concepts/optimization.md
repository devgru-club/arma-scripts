According to the [BIS wiki](https://community.bistudio.com/wiki/) article on [code optimization](https://community.bistudio.com/wiki/Code_Optimisation#Make_it_fast.), switch statements have more overhead that if/then statements.

Their clever solution was the following:

```sqf
call {
  if (cond1) exitWith {//code 1};
  if (cond2) exitWith {//code 2};
  if (cond3) exitWith {//code 3};
//default code };
```

Note the clarification on [exitWith](https://community.bistudio.com/wiki/exitWith) provided by [killzonekid](http://killzonekid.com/):

> I'd like to clarify the nature of this command to avoid any further confusion: The command will exit the current scope - no ifs, no buts.

> If the current scope is a loop, it will exit the loop. If the current scope is the main body of a script, it will exit the script. For more understanding of scopes and exitWith have a look at this [resource](http://killzonekid.com/arma-scripting-tutorials-scopes/). 
