#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Hooks a unit into a vehicle's static line.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [objectParent ace_player, ace_player] call aftb_staticLine_fnc_hook;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_hook",_vehicle,_unit);

if (_unit getVariable [QGVAR(isHooked), false]) exitWith {};

if (ace_player == _unit) then {
    playSound QGVAR(hook);
};

_unit setVariable [QGVAR(isHooked), true, true];
nil;