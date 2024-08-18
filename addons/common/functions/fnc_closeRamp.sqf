#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Closes a vehicle's ramp.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Instant (optional, default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call haf_common_fnc_closeRamp;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_instant", false, [false]]
];
TRACE_1("fnc_closeRamp",_vehicle);

[_vehicle] call FUNC(getRampAnimation) params ["_anim", "_closed"];

_vehicle animateSource [_anim, _closed, _instant];
_vehicle animateDoor [_anim, _closed, _instant];

_closed;