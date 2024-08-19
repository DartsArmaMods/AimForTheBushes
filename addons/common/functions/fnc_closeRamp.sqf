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

private _rampAnims = [_vehicle] call FUNC(getRampAnimations);
{
    _x params ["_anim", "_closed", "_opened"];
    _phase = linearConversion [0, 1, _phase, _closed, _opened, true];

    // Vanilla vehicles seem to use animateDoor, while modded tend to use animateSource
    _vehicle animateSource [_anim, _phase, _instant];
    _vehicle animateDoor [_anim, _phase, _instant];
} forEach _rampAnims;

_closed;