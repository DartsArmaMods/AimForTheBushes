#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit satisfies the vehicle's jump condition.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * True if the unit satisfies the vehicle's jump condition, otherwise false <BOOL>
 *
 * Example:
 * [objectParent ace_player, ace_player] call aftb_staticLine_fnc_checkJumpCondition;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_checkJumpCondition",_vehicle,_unit);

private _rampAnims = _vehicle call EFUNC(common,getRampAnimations);
private _jumpCondition = compile getText (configOf _vehicle >> QGVAR(condition));

if (_jumpCondition isEqualTo {}) then { _jumpCondition = { true }; };

[_vehicle, _unit, _rampAnims] call _jumpCondition
