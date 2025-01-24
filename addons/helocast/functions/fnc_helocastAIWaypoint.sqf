#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Waypoint function for the helocast waypoint.
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
 * [_group, [100, 100, 0]] call aftb_staticLine_fnc_helocastAIWaypoint;
 *
 * Public: No
 */

#define COMPLETION_RADIUS 50

params ["_group", "_position"];
TRACE_2("fnc_helocastAIWaypoint",_group,_position);

private _vehicle = objectParent leader _group;
private _commander = effectiveCommander _vehicle;
private _speedMode = speedMode _group;

#ifdef DEBUG_MODE_FULL
    private _wpMarker = createMarkerLocal [format ["%1_helocastWaypoint", _vehicle], _position];
    _wpMarker setMarkerShapeLocal "ELLIPSE";
    _wpMarker setMarkerColorLocal "ColorYellow";
    _wpMarker setMarkerSize [COMPLETION_RADIUS, COMPLETION_RADIUS];
#endif

// Ideally this should be updated to run unscheduled, but I can't be assed to rewrite them into CBA_waitUntilAndExecutes

// - Approach -----------------------------------------------------------------
if (_vehicle distance2D _position > COMPLETION_RADIUS) then {
    // _group setSpeedMode "LIMITED";
    _vehicle flyInHeight [10, true];
    _commander doMove _position;
    waitUntil {_vehicle distance2D _position < COMPLETION_RADIUS};
    waitUntil {vectorMagnitude (velocity _vehicle) < 3};
    [QGVAR(helocastWaypointStarted), [_vehicle, _position]] call CBA_fnc_globalEvent;
};

_vehicle call EFUNC(common,openRamp);

// Wait for door to open
sleep 2;

// - Deployment ---------------------------------------------------------------
private _boats = _vehicle getVariable [QGVAR(loadedBoats), []];
{
    [_vehicle, _x] call FUNC(unloadBoat);
    waitUntil {
        systemChat "wait for isUnload == false";
        systemChat str (_vehicle getVariable [QGVAR(isUnloading), false]);
        !(_vehicle getVariable [QGVAR(isUnloading), false])
    };
} forEach _boats;
waitUntil {
    // systemChat "wait for _boats == []";
    _boats isEqualTo [];
};

// TODO: Deploy AI
// eject getPassengers and then tell them to board the boat(s)?

_group setSpeedMode _speedMode;
_vehicle flyInHeight [100, true];

#ifdef DEBUG_MODE_FULL
    deleteMarker _wpMarker;
#endif

_vehicle call EFUNC(common,closeRamp);
[QGVAR(helocastWaypointFinished), [_vehicle, _position]] call CBA_fnc_globalEvent;
true;