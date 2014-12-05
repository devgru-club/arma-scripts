/*

  Author: ])rStrangelove, modified for http://github.com/devynspencer/valkyrie
  Filename: get_nearestMarker.sqf
  Description: returns the nearest marker to the specified point
  Example uses:
  
  * Spawn a unit, use get_nearestMarker find the nearest marker to a unit's spawn location, and then have the unit overwatch the position using another script. Allows for all markers on a map to be given the same randomized pool of patrol scripts.
  
*/

private [
  "_nearest",
  "_break",
  "_array",
  "_pos",
  "_i",
  "_marker"
];

_nearest = "";
_pos = _this select 0;
_array = _this select 1;

_i = count _array - 1;

// if array isnt empty use last array marker as nearest to compare others against
if (_i > -1) then {
  _nearest = _array select _i;
};

if ((getmarkerpos _nearest) select 0 == 0) then {
  _nearest = "";
};

// compare each remaining marker in the array against the current nearest
while {_i > 0} do {
  _i = _i - 1;

  _marker = _array select _i;

  // compare distances between _pos and _marker and check which is smaller of the two compared values
  if ( ((getmarkerpos _marker) distance _pos) < ((getmarkerpos _nearest) distance _pos) ) then {
    _nearest = _marker;
    // player sidechat format["%1 is nearest now", _nearest]
  };
};

// return nearest marker from array
_nearest
