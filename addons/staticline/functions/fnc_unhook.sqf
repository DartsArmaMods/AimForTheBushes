#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Unhooks a unit from a vehicle's static line.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [objectParent ace_player, ace_player] call haf_staticLine_fnc_unhook;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_unhook",_vehicle,_unit);

[_unit, QGVAR(unhook)] call EFUNC(common,say3D);
_unit setVariable [QGVAR(isHooked), nil, true];