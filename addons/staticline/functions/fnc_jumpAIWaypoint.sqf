#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Waypoint function for the static line jump waypoint.
 * Based on https://github.com/acemod/ACE3/blob/master/addons/fastroping/functions/fnc_deployAIWaypoint.sqf
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Waypoint position <ARRAY>
 *
 * Return Value:
 * true <BOOL>
 *
 * Example:
 * [_group, [100, 100, 0]] call haf_staticLine_fnc_jumpAIWaypoint;
 *
 * Public: No
 */

#define COMPLETION_RADIUS 50

params [
    ["_group", grpNull, [grpNull]],
    ["_position", [0, 0, 0], [[]], 3]
];
TRACE_2("fnc_jumpAIWaypoint",_group,_position);

private _vehicle = objectParent leader _group;
private _commander = effectiveCommander _vehicle;

getArray (configOf _vehicle >> QUOTE(ADDON) >> "doorAnim") params ["_animSource", ["_closedState", 0], ["_openState", 1]];

// Ideally this should be updated to run unscheduled, but I can't be assed to rewrite four CBA_waitUntilAndExecutes

// - Approach -----------------------------------------------------------------
if (_vehicle distance2D _position > COMPLETION_RADIUS) then {
    _vehicle flyInHeight [GVAR(flyInHeight), true];
    _commander doMove _position;
    waitUntil {_vehicle distance2D _position < COMPLETION_RADIUS}; // Needs tweaking
    _vehicle animateDoor [_animSource, _openState];
};

// - Deployment ---------------------------------------------------------------
[_vehicle] call FUNC(jumpAI);
waitUntil {(_vehicle getVariable [QGVAR(unitsToDeploy), []]) isNotEqualTo []};
waitUntil {(_vehicle getVariable [QGVAR(unitsToDeploy), []]) isEqualTo []};

_vehicle animateDoor [_animSource, _closedState];
true;