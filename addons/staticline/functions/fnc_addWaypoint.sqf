#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Adds a static line jump waypoint to the given group.
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Waypoint parameters <ARRAY>
 *    Exact parameters for https://community.bistudio.com/wiki/addWaypoint
 *
 * Return Value:
 * The created waypoint <ARRAY>
 *
 * Example:
 * [group _plane, [getPosASL ace_player, -1]] call aftb_staticLine_fnc_addWaypoint;
 *
 * Public: Yes
 */

params [
    ["_group", grpNull, [grpNull]],
    ["_waypointParams", [], [[]], [2, 3, 4]]
];
TRACE_2("fnc_addWaypoint",_group,_waypointParams);

if (isNull _group) exitWith {};

private _waypoint = _group addWaypoint _waypointParams;
_waypoint setWaypointType "SCRIPTED";
_waypoint setWaypointScript QPATHTOF(functions\fnc_jumpAIWaypoint.sqf);

_waypoint;
