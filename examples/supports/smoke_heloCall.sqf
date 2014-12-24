/*

  author: devyn spencer
  about: calls a light helicopter to position marked by white smoke grenade
  
*/

player addEventHandler ["Fired", {
  _null = _this spawn {

    _type = _this select 4;

    if (_type isEqualTo "SmokeShell") then {
      _object = _this select 6;
      _position = position _object;

      _origin = [_position, 1000, floor random 360] call BIS_fnc_relPos;
      _unit = [_origin, 180, "B_Heli_Light_01_F", side player] call BIS_fnc_spawnVehicle;
      
      unitActual = _unit select 0;
      _unitGroup = _unit select 2;
      
      _wp = _unitGroup addWaypoint [position player, 0];
      _wp setWaypointType "LOITER";
      _wp setWaypointLoiterType "CIRCLE_L";
      _wp setWaypointLoiterRadius 75;
    };
  };
}];
