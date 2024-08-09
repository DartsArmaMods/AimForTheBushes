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

private _jumpCondition = compile getText (configOf _vehicle >> QUOTE(ADDON) >> "condition");
if (_jumpCondition isEqualTo {}) then {
    _jumpCondition = {true};
};

_unit getVariable [QGVAR(isHooked), false] and {
    [_vehicle, _unit] call _jumpCondition;
};