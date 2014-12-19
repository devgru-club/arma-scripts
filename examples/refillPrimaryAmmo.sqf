/*

  name: v_refillPrimaryAmmo
  author: devyn spencer
  url: http://github.com/devynspencer
  notes: based on the A3 wasteland script, but different in that it works
         in situations where the primary weapon has no ammo.

*/

private [
  "_unit",
  "_weapon",
  "_magazines",
  "_magazine",
  "_magCount"
];

_unit      = _this;
_weapon    = currentWeapon _unit;
_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
_magazine  = "";
_magCount  = 6;

if ((count _magazines) > 1) then {
  _magazine = _magazines call BIS_fnc_selectRandom;
} else {
  _magazine = _magazines select 0;
};

_unit addMagazines [_magazine, _magCount];
