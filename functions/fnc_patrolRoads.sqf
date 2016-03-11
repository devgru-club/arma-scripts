// fnc_patrolRoads.sqf

_position = player; // Can edit for object/array
_radius = 300; // Change size
MIS_roads = _position nearRoads _radius;
MIS_roadRoute = [];
MIS_unit = BManGroupLeader; // Change to unit in group

// toggle debug
MIS_debug = true; // Change to false to disable

// set ai waypoints
_group = group MIS_unit;

// get connected roads
for "_i" from 1 to ((count MIS_roads) - 1) do {
	_seg = MIS_roads select _i;
	_segPrev = MIS_roads select (_i - 1);

	if (_segPrev in (roadsConnectedTo _seg)) then {
		// add road to route
		MIS_roadRoute set [(count MIS_roadRoute),_seg];
		
		if ((count MIS_roadRoute) <= 1) then {
			{_x setpos getpos _seg} foreach units _group;
		} else {
			_wp = _group addWaypoint [(getpos _seg),0];
			_wp setWaypointType "MOVE";
			_wp setWaypointSpeed "FULL";
			_wp setWaypointBehaviour "CARELESS";
		};		
	};
};

if !(MIS_debug) exitWith {};
waitUntil {!isNull (findDisplay 12)};

(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", {
	_ctrl = _this select 0;

	// draw arrows from each point
	for "_i" from 1 to ((count MIS_roadRoute) - 1) do {
		_seg = MIS_roadRoute select _i;
		_segPrev = MIS_roadRoute select (_i - 1);
		_ctrl drawArrow [(getpos _segPrev),(getpos _seg),[0,0,0,1]];
	};

	for "_i" from 0 to ((count MIS_roads) - 1) do {
		_seg = MIS_roads select _i;
		
		_ctrl drawIcon [
			"a3\ui_f_curator\Data\CfgCurator\waypoint_ca.paa",
			[0,1,1,1],
			getpos _seg,
			15,
			15,
			0,
			(str (count (roadsConnectedTo _seg))),
			0,
			0.05,
			"PuristaLight",
			"right"
		];
	};

	_ctrl drawRectangle [player,100,100,0,[0,0,0,1],""];

	// get active waypoint
	_group = group BManGroupLeader;
	_curWp = currentWaypoint _group;
	_curWpPos = waypointPosition [_group,_curWp];

	_ctrl drawIcon [
		"a3\ui_f_curator\Data\CfgCurator\waypoint_ca.paa",
		[1,0,0,1],
		_curWpPos,
		24,
		24,
		0,
		(str ((leader _group) distance _curWpPos)),
		0,
		0.05,
		"PuristaLight",
		"right"
	];

	_ctrl drawIcon [
		"a3\ui_f_curator\Data\CfgCurator\waypoint_ca.paa",
		[0,0,1,1],
		getpos (leader _group),
		24,
		24,
		0,
		str _group,
		0,
		0.05,
		"PuristaLight",
		"right"
	];
}];

if (true) exitWith {};
