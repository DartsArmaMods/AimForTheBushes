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

#define COMPLETION_RADIUS 150
#define START_POS_DISTANCE -2000

params ["_group", "_position"];
TRACE_2("fnc_jumpAIWaypoint",_group,_position);

private _vehicle = objectParent leader _group;
private _direction = direction _vehicle;
private _commander = effectiveCommander _vehicle;

getArray (configOf _vehicle >> QUOTE(ADDON) >> "doorAnim") params ["_animSource", ["_closedState", 0], ["_openState", 1]];

private _startPosition = _position vectorAdd [
    START_POS_DISTANCE * sin _direction,
    START_POS_DISTANCE * cos _direction,
    0
];

#ifdef DEBUG_MODE_FULL
    private _marker = createMarkerLocal [format ["%1_staticLineDropWaypoint", _vehicle], _position];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerColorLocal "ColorYellow";
    _marker setMarkerSize [COMPLETION_RADIUS, COMPLETION_RADIUS];

    _marker = createMarkerLocal [format ["%1_staticLineDropEnd", _vehicle], _startPosition];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerColorLocal "ColorOrange";
    _marker setMarkerSize [COMPLETION_RADIUS, COMPLETION_RADIUS];
#endif

// Ideally this should be updated to run unscheduled, but I can't be assed to rewrite them into CBA_waitUntilAndExecutes

// - Approach -----------------------------------------------------------------
if (_vehicle distance2D _startPosition > COMPLETION_RADIUS) then {
    _commander doMove _startPosition;
    waitUntil {_vehicle distance2D _startPosition < COMPLETION_RADIUS};
    _vehicle animateDoor [_animSource, _openState];
    _commander doMove _position;
    [QGVAR(jumpWaypointStarted), [_vehicle, _startPosition, _position]] call CBA_fnc_globalEvent;
};

// Wait for door to open
sleep 2;

// - Deployment ---------------------------------------------------------------
[_vehicle] call FUNC(jumpAI);
waitUntil {(_vehicle getVariable [QGVAR(unitsToDeploy), []]) isEqualTo []};

_vehicle animateDoor [_animSource, _closedState];
[QGVAR(jumpWaypointFinished), [_vehicle, _startPosition, _position]] call CBA_fnc_globalEvent;
true;