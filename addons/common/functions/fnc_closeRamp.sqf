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
 * _vehicle call aftb_common_fnc_closeRamp;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_instant", false, [false]]
];
TRACE_2("fnc_closeRamp",_vehicle,_instant);

private _rampAnims = _vehicle call FUNC(getRampAnimations);
{
    _x params ["_anim", "_closed"];
    // Vanilla vehicles seem to use animateDoor, while modded tend to use animateSource
    _vehicle animateSource [_anim, _closed, _instant];
    _vehicle animateDoor [_anim, _closed, _instant];
} forEach _rampAnims;

nil;