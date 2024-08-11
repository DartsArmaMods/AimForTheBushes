#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit can unhook from a static line.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * True if unit can unhook, otherwise false <BOOL>
 *
 * Example:
 * [objectParent ace_player, ace_player] call haf_staticLine_fnc_canUnhook;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_canUnhook",_vehicle,_unit);

_unit getVariable [QGVAR(isHooked), false];