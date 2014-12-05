/*
  @file: 'supportInit.sqf'

  @author: Larrow

  @description: initialize support call-ins for a player

  @params:
    - player    => player to init support options for
    - requester => name of requester module
    - provider  => type of support, ie: Artillery/Transport/CAS_Heli/CAS_Bombing/Drop

  @example 1:

    scriptHandle = [] execVM "SupplyDrop.sqf";

  @example 2:

    [player, requester, provider] call BIS_fnc_addSupportLink;

  @example 3: change the number / type of support available:

    [requester, "Drop", 0] call BIS_fnc_limitSupport;

*/

_center     = createCenter sideLogic; // side logic
_logicGroup = createGroup _center; // modules group
_requester  = _logicGroup createUnit ["SupportRequester", getpos player, [], 0, "FORM"]; // support requester
_pos        = [player, 1000, (floor (random 360))] call BIS_fnc_relPos; // create random spawn position
_provider   = _logicGroup createUnit ["SupportProvider_Virtual_Drop", _pos, [], 0, "FORM"]; // init support provider

{ // forEach [provider, ... provider]
  [_requester, _x, 0] call BIS_fnc_limitSupport; // reset support requests for each type

// setup requester values
} forEach [
  "Artillery",
  "CAS_Heli",
  "CAS_Bombing",
  "UAV",
  "Drop",
  "Transport"
];

{ // forEach [provider, ... provider]
  _provider setVariable [(_x select 0), (_x select 1)];

// setup provider values
} forEach [
  ["BIS_SUPP_crateInit", ""], // init code for crate
  ["BIS_SUPP_vehicles", []], // types of vehicles to use
  ["BIS_SUPP_vehicleinit", ""], // init code for vehicle
  ["BIS_SUPP_filter", "SIDE"] // whether default vehicles comes from "SIDE" or "FACTION"
];

/*

// for using non-virtual providers:
_vehicle synchronizeObjectsAdd [_newProvider];
_newProvider synchronizeObjectsAdd [_vehicle];

*/

// set limit on requester to 1
[_requester, "Drop", 1] call BIS_fnc_limitSupport;

// add the support option to the player
[player, _requester, _provider] call BIS_fnc_addSupportLink;
