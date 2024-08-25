#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Opens a vehicle's ramp.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Instant (optional, default: false) <BOOL>
 * 2: Animation phase percent (optional, default: 1) <NUMBER>
 *    - Number between 0 and 1.
 *    - How "open" the door is, 0.5 is half-way open.
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call aftb_common_fnc_openRamp;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_instant", false, [false]],
    ["_phase", 1, [1]]
];
TRACE_3("fnc_openRamp",_vehicle,_instant,_phase);

private _rampAnims = [_vehicle] call FUNC(getRampAnimations);
{
    _x params ["_anim", "_closed", "_opened"];
    _phase = linearConversion [0, 1, _phase, _closed, _opened, true];

    // Vanilla vehicles seem to use animateDoor, while modded tend to use animateSource
    _vehicle animateSource [_anim, _phase, _instant];
    _vehicle animateDoor [_anim, _phase, _instant];
} forEach _rampAnims;

nil;