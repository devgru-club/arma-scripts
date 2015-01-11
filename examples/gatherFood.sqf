_foodObjs = ["Land_CratesShabby_F", "Land_CratesWooden_F", "Land_Sacks_goods_F", "Land_Sacks_heap_F"];

_position = position player;
_distance = 5;
_resPos = [_position, _distance, floor random 360] call BIS_fnc_relPos;

_resource = [
  ["food", _foodObjs]
] call BIS_fnc_selectRandom;

_resTitle = _resource select 0;
_resObjClass = (_resource select 1) call BIS_fnc_selectRandom;
_resObj = _resObjClass createVehicle _resPos;

gatherResource = {
  _amount = ceil random 25;
  _resource = "food";
  _message = format ["+%1 %2 gathered", _amount, _resource];

  disableSerialization;
  cutRsc ["hudMessages", "PLAIN"];
  waitUntil {!isNull (uiNameSpace getVariable "hudMessages")};

  _display = uiNameSpace getVariable "hudMessages";
  _setText = _display displayCtrl 1001;
  _setText ctrlSetStructuredText (parseText _message);
};

_resAction = format ["Gather %1", _resTitle];
_resObj addAction [_resAction, {[] call gatherResource}];
