#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Called from getOutMan event handler.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Role (Unused) <STRING>
 * 2: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player, "", objectParent ace_player] call haf_staticLine_fnc_getOutMan;
 *
 * Public: No
 */

params ["_unit", "", "_vehicle"];
TRACE_2("fnc_getOutMan",_vehicle,_unit);

if ([_vehicle, _unit] call FUNC(canJump)) then {
    [_vehicle, _unit] call FUNC(jump);
};

[_vehicle, _unit] call FUNC(unhook);
nil;