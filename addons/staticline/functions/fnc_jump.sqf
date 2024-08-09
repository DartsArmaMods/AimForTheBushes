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
 * [objectParent ace_player, ace_player] call haf_staticLine_fnc_jump;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_jump",_vehicle,_unit);

// isHooked is always reset when exiting vehicle

[QGVAR(jumped), [_unit, _vehicle]] call CBA_fnc_localEvent;