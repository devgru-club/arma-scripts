private ["_aU", "_dU"];
_aU = allUnits;

sleep 120;
while {true} do {
   sleep 60;
   if (count _aU != count allUnits) then {
      _dU = _aU - allUnits;
      {hidebody _x} foreach _dU;
   };
   _aU = allUnits;
};
