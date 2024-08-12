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
 * [objectParent ace_player, ace_player] call haf_staticLine_fnc_canJump;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_canJump",_vehicle,_unit);

private _config = configOf _vehicle >> QUOTE(ADDON);
[_vehicle] call EFUNC(common,getRampAnimation) params ["_anim", "_closed", "_opened"];

private _jumpCondition = compile getText (_config >> "condition");
if (_jumpCondition isEqualTo {}) then {
    _jumpCondition = { true };
};

_unit getVariable [QGVAR(isHooked), false] and
{ _vehicle animationSourcePhase _anim == _opened } and
{ [_vehicle, _unit, [_anim, _closed, _opened]] call _jumpCondition };