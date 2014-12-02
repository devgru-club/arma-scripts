/*

  author:       BIS
  file:         introBlackout.sqf
  example uses: try this at the very top of your init.sqf or initPlayerLocal.sqf as a transition

*/

[ "BIS_ScreenSetup", false ] call BIS_fnc_blackOut;

sleep 5;

[ "BIS_ScreenSetup", true ] call BIS_fnc_blackIn;
