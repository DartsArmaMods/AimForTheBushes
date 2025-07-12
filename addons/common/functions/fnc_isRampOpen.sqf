#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a vehicle's ramp is open.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Check all doors (optional, default: false) <BOOL>
 *
 * Return Value:
 * True if ramp(s) are open, otherwise false <BOOL>
 *
 * Example:
 * _vehicle call aftb_common_fnc_isRampOpen;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_checkAll", false, [false]]
];
TRACE_2("fnc_isRampOpen",_vehicle,_checkAll);

private _return = true;
private _rampAnims = _vehicle call FUNC(getRampAnimations);

if (_checkAll) then {
    {
        _x params ["_anim", "_closed", "_opened"];
        if (_vehicle animationSourcePhase _anim != _opened) exitWith {
            _return = false;
        };
    } forEach _rampAnims;
} else {
    private _rampAnim = (_rampAnims select 0) params ["_anim", "_closed", "_opened"];
    if (_vehicle animationSourcePhase _anim != _opened) then {
        _return = false;
    };
};

_return;
