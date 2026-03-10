#include "..\script_component.hpp"
/*
 * Author: mrschick
 * Checks if a unit can command the static line jump of an embarked+hooked player or AI group.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * True if unit can command jumps, otherwise false <BOOL>
 *
 * Example:
 * [objectParent ace_player, ace_player] call aftb_staticLine_fnc_canDeployGroups;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_canDeployGroups",_vehicle,_unit);

GVAR(commandGroupJumps) > 0 && {
    (_unit == leader _unit) || {_unit getVariable [QGVAR(isJumpMaster), false]} || {[_vehicle, _unit] call FUNC(isAircraftCrew)}
} && {
    _vehicle call EFUNC(common,isRampOpen) && { [_vehicle, _unit] call FUNC(checkJumpCondition) }
};
