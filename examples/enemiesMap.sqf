/*

  @file: 'supports\supportMigrate.sqf'

  @descripton: displays dots on map with most recent position of enemies.

  @author: Benjamin Panell, modified for http://github.com/devynspencer/arma-scripts

  @params: [enabled, interval, condition, style]
  - enabled   => enable the updated map markers globally (default: true)
  - interval  => time between map updates (default: 10)
  - condition => determines which units shown (default: { side _x != side player })
  - style     => marker icon used for units (default: "mil_dot")

*/

private ["_enabled", "_interval", "_condition", "_style", "_units", "_markerName", "_newUnits"];

_enabled   = [_this, 0, true, [true]] call BIS_fnc_param;
_interval  = [_this, 1, 10, [1]] call BIS_fnc_param;
_condition = [_this, 2, { side _x != side player }, [{true}]] call BIS_fnc_param;
_style     = [_this, 3, "mil_dot", [""]] call BIS_fnc_param;

position_markers = _enabled;
publicVariable "position_markers";
position_markers_interval = _interval;
publicVariable "position_markers_interval";

if !(_enabled) exitWith {false};

// ensure global variable is defined
if (isServer && (isNil "position_markers_active_server")) then {
  position_markers_active_server = false;
};

if (isNil "position_markers_active") then { position_markers_active = false; };

// populate an array of units to be affected
_units = [];

{ // forEach allUnits
  if (alive _x && (call _condition)) then {
    _units set [count _units, _x];
  };
} forEach allUnits;

// global variable; only updated by the server
position_markers_units = _units;
publicVariable "position_markers_units";
position_markers_dead = [];
publicVariable "position_markers_dead";

// start the server update script
if (isServer && !position_markers_active_server) then {
  [] spawn {
    position_markers_active_server = true;

    while {position_markers} do {

      // Update units list by removing dead units
      sleep position_markers_interval / 2;

      if ({!alive _x} count position_markers_units > 0) then {
        _newUnits = [];

        { // forEach position_markers_units
          if (alive _x) then {
            _newUnits set [count _newUnits, _x];
          } else {
            position_markers_dead set [count position_markers_dead, _x];
          };
        } forEach position_markers_units;

        position_markers_units = _newUnits;
        publicVariable "position_markers_units";
        publicVariable "position_markers_dead";
      };
    };

    position_markers_active_server = false;
  };
};

if !(position_markers_active) then {
  [_style] spawn {
    _style = _this select 0;
    position_markers_active = true;

    while {position_markers} do {

      { // forEach position_markers_units
        _marker = _x getVariable "position_marker";

        if ((isNil {_marker})) then {
          _markerName = str(format ["position_marker_%1", name _x]);

          _marker = createMarkerLocal [_markerName, position _x];
          _marker setMarkerSizeLocal [0.6,0.6];
          _marker setMarkerShapeLocal "ICON";
          _marker setMarkerTypeLocal _style;

          if (side _x == side player) then {
            _marker setMarkerColorLocal "ColorBlue";
          } else {
            _marker setMarkerColorLocal "ColorRed";
          };

          _x setVariable ["position_marker", _marker];
        };

        _marker setMarkerPosLocal position _x;
        _marker setMarkerDirLocal direction _x;

      } forEach position_markers_units;

      { // forEach position_markers_dead
        _marker = _x getVariable "position_marker";

        if !(isNil {_marker}) then {
          deleteMarkerLocal _marker;

          _x setVariable ["position_marker", nil];
        };
      } forEach position_markers_dead;

      sleep position_markers_interval;
    };

    { // forEach position_markers_units
      _marker = _x getVariable "position_marker";

      if !(isNil {_marker}) then {
        deleteMarkerLocal _marker;

        _x setVariable ["position_marker", nil];
      };
    } forEach position_markers_units;

    { // forEach position_markers_dead
      _marker = _x getVariable "position_marker";

      if !(isNil {_marker}) then {
        deleteMarkerLocal _marker;

        _x setVariable ["position_marker", nil];
      };
    } forEach position_markers_dead;

    position_markers_active = false;
  };
};

true
