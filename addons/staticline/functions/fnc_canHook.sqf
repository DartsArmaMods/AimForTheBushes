#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit can hook into a static line.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * True if unit can hook, otherwise false <BOOL>
 *
 * Example:
 * [objectParent ace_player, ace_player] call aftb_staticLine_fnc_canHook;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_canHook",_vehicle,_unit);

!(_unit getVariable [QGVAR(isHooked), false]);
