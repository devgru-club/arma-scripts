/*

  @file: 'supports\supportMigrate.sqf'

  @descripton: Allows a support vehicle (repair/rearm/refuel) to be called by the player.
    Vehicle moves to player position and leaves when the player moves out of the vicinity

  @author: Benjamin Panell, modified for http://github.com/devynspencer/arma-scripts

  @params: [vehicle, target, radius, timeout]
  - vehicle => vehicle providing support
  - target  => player/object to receive support (default: player)
  - radius  => radius to determine if player is using the support (default: 50)

  @example 1:

  _ = [support_ammo, player, getMarkerPos "depot"] execVM "Support\SupportVehicleRequest.sqf";

*/

private ["_vehicle", "_target", "_home_pos", "_wp1", "_rpos", "_radius"];

_vehicle = [_this, 0] call BIS_fnc_param;
_target  = [_this, 1, player, [_vehicle,objnull]] call BIS_fnc_param;
_radius  = [_this, 2, 30, [1]] call BIS_fnc_param;
_timeout = [_this, 3, 60, [1]] call BIS_fnc_param;

if (_vehicle getVariable "Sierra_support_tasked") exitWith {
 hint "Support Vehicle Busy";
};

_vehicle setVariable ["Sierra_support_tasked", true];

// trick the vehicle into thinking it has already returned home
if (count waypoints group _vehicle > 0) then {
  (waypoints group _vehicle select count waypoints group _vehicle - 1) setWPPos getPosATL _vehicle;
};

// remove all group waypoints
while {(count (waypoints group _vehicle)) > 0} do {
  deleteWaypoint ((waypoints group _vehicle) select 0);
};

if !(missionNamespace getVariable "support_busy") then {
  missionNamespace setVariable ["support_busy", true];

  // radio request chatter
  player sidechat "Logistics, message. Over.";
  sleep 4.0;

  _vehicle sidechat "Send it. Over.";
  sleep 3.0;

  player sidechat "Request support at my location. How copy?";
  sleep 5.0;

  _vehicle sidechat "Good copy, vehicle deployed, standby. Out";

  missionNamespace setVariable ["support_busy", false];
};

// Give them a new move waypoint
_rpos = getPosATL _target;

_wp1 = group _vehicle addWaypoint [[(_rpos select 0) + _radius - random (2 * _radius), (_rpos select 1)  + _radius - random (2 * _radius), _rpos select 2], 0];

_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointSpeed "FULL";

// Wait for the vehicle to arrive at the waypoint
waitUntil {sleep 5; vehicle _vehicle distance _rpos < _radius};

_arrive_time = time;

if (vehicle _vehicle distance _target > 4 * _radius && !(missionNamespace getVariable "support_busy")) then {
  missionNamespace setVariable ["support_busy", true];

  _vehicle sidechat "Support has arrived at target location.";
  sleep 8.0;

  missionNamespace setVariable ["support_busy", false];
};

// wait for player vehicle to come in range
waitUntil {sleep 5; (vehicle _vehicle distance _target < 10 || time > (_arrive_time + _timeout))};

// wait for resupply/repair/rearm to complete
waitUntil {sleep 5; (vehicle _vehicle distance _target > (2 * _radius) || time > (_arrive_time + _timeout))};

// remove all group waypoints
while {(count (waypoints group _vehicle)) > 0} do {
  deleteWaypoint ((waypoints group _vehicle) select 0);
};

// give support a new move waypoint
_rpos = _vehicle getVariable "support_home";

_wp1 = group _vehicle addWaypoint [[(_rpos select 0) + _radius - random (2 * _radius), (_rpos select 1)  + _radius - random (2 * _radius), _rpos select 2], 0];

_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointSpeed "FULL";

_vehicle setVariable ["support_tasked", false];
