/*

  @file: 'supports\supportMigrate.sqf'

  @descripton: Allows a support vehicle (repair/rearm/refuel) to be called by the player.
    Vehicle moves to player position and leaves when the player moves out of the vicinity

  @author: Benjamin Panell, modified for http://github.com/devynspencer/arma-scripts

  @params: [vehicles, home_position]
    - vehicles      => The vehicles providing the support for the player
    - home_position => The position that the vehicle should return to (default: getPosATL (_vehicles select 0))

  @example 1

    _ = [support_ammo, getMarkerPos "depot"] call Sierra_fnc_SupportVehicleInit;

*/

if(!isServer) exitWith {};

private ["_vehicles", "_home"];

// specify support type
_vehicles = [_this, 0] call BIS_fnc_param;

// perform input validation on _vehicles
if (typeName _vehicles != "ARRAY") then {
  _vehicles = [_vehicles];
};

// specify home position
_home = [_this, 1, getPosATL (_vehicles select 0)] call BIS_fnc_param;

{ // forEach _vehicles
  _x setVariable ["support_home", _home];

  if !(_x getVariable "support_tasked") then {
    _wp1 = group _x addWaypoint [_home, 0];

    _wp1 setWaypointType "MOVE";
    _wp1 setWaypointBehaviour "CARELESS";
    _wp1 setWaypointSpeed "FULL";
  };

} forEach _vehicles;
