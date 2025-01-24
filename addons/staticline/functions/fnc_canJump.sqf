#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit jump from a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * True if unit can jump, otherwise false <BOOL>
 *
 * Example:
 * [objectParent ace_player, ace_player] call aftb_staticLine_fnc_canJump;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_canJump",_vehicle,_unit);

private _rampAnims = _vehicle call EFUNC(common,getRampAnimations);

private _jumpCondition = compile getText (configOf _vehicle >> QGVAR(condition));
if (_jumpCondition isEqualTo {}) then {
    _jumpCondition = { true };
};

_unit getVariable [QGVAR(isHooked), false] and
{ _vehicle call EFUNC(common,isRampOpen) } and
{ [_vehicle, _unit, _rampAnims] call _jumpCondition };