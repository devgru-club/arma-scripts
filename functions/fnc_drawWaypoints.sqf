// fnc_drawWaypoints.sqf

["MIS_drawWaypoints", "onEachFrame", {

	_group = group player;
	_waypoints = waypoints _group;

	for "_i" from 1 to ((count _waypoints) - 1) do {
	  // TODO: refactor into new function draw_wp_lines
		_waypoint = _waypoints select _i;
		_wpPrev = _waypoints select (_i -1);
		_pos = waypointPosition _waypoint;
		_pos set [2,((_pos select 2) + 1.5)];
		_wpPrevPos = waypointPosition _wpPrev;
		_wpPrevPos set [2,((_wpPrevPos select 2) + 1.5)];
		_type = waypointType _waypoint;
		_color = [1,1,1,1];

		if ((currentWaypoint _group) == (_waypoint select 1)) then {
			_color = [0,1,1,1];
		};

		drawIcon3D [
			"a3\ui_f_curator\Data\CfgCurator\waypoint_ca.paa",
			_color,
			_pos,
			0.6,
			0.6,
			0,
			_type,
			0,
			0.03,
			"PuristaLight",
			"right"
		];
		
		// Draws waypoint lines
		drawLine3D [_wpPrevPos,_pos,[1,0,0,1]];
	};

}] call BIS_fnc_addStackedEventHandler;
