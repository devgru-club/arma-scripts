The following are useful snippets of sqf code relating to waypoint creation and management.

```sqf
// create unload waypoint
_dropWpUnload = _dropSpawnGroup addWaypoint [_dropTarget, 10];
_dropWpUnload setWaypointType "TR UNLOAD";
_dropWpUnload setWaypointBehaviour "CARELESS";
_dropWpUnload setWaypointSpeed "FULL";

// create return waypoint
_dropWpExit = _dropSpawnGroup addWaypoint [_dropOrigin, 0];
_dropWpExit setWaypointType "MOVE";

// delete transport upon reaching return waypoint
_dropWpExit setWaypointStatements ["true",
  "deleteVehicle (vehicle this); { deleteVehicle _x } forEach thislist; deleteGroup (group this);"
];
```
