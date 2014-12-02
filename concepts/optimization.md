According to the [BIS wiki](https://community.bistudio.com/wiki/) article on [code optimization](https://community.bistudio.com/wiki/Code_Optimisation#Make_it_fast.), switch statements have more overhead that if/then statements.

Their clever solution was the following:

```sqf
call {
  if (cond1) exitWith {//code 1};
  if (cond2) exitWith {//code 2};
  if (cond3) exitWith {//code 3};
//default code };
```
