/*

  @file: 'supports\supportInit.sqf'

  @descripton: Allows a support vehicle (repair/rearm/refuel) to be called by the player.
  Vehicle moves to player position and leaves when the player moves out of the vicinity

  @author: Benjamin Panell, modified for http://github.com/devynspencer/arma-scripts

  @params [vehicle, home_position, invincible, infinite]
  - vehicle       => vehicle providing support
  - home_position => position vehicle returns to (default: getPosATL vehicle)
  - invincible    => support invincible? (default: false)
  - infinite      => supply stock unlimited? (default: false)

  @example 1

    _ = [support_ammo, getMarkerPos "depot"] call Sierra_fnc_SupportVehicleInit;

*/

if(!isServer) exitWith {};

private ["_vehicle", "_home", "_invincible"];

_vehicle    = [_this, 0] call BIS_fnc_param;
_home       = [_this, 1, getPosATL _vehicle, [[]], [3]] call BIS_fnc_param;
_invincible = [_this, 2, true, [false]] call BIS_fnc_param;
_infinite   = [_this, 3, true, [false]] call BIS_fnc_param;

_vehicle setVariable ["support_tasked", false];
_vehicle setVariable ["support_home", _home];

missionNamespace setVariable ["support_busy", false];

if (_invincible) then {
  { // forEach [vehicle _vehicle] + crew vehicle _vehicle
    _x allowDamage false;
  } forEach [vehicle _vehicle] + crew vehicle _vehicle;
};

if(_infinite) then {
  [_vehicle] spawn {
    _vehicle = _this select 0;
    while(true) {
      sleep 2;
      _vehicle setAmmoCargo 1;
      _vehicle setFuelCargo 1;
      _vehicle setRepairCargo 1;
    }
  }
};
