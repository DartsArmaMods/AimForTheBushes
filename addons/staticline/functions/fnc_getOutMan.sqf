#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Called from getOutMan event handler.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Role (Unused) <STRING>
 * 2: Vehicle <OBJECT>
 * 3: Turret path (Unused) <ARRAY>
 * 4: Is eject <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player, "", objectParent ace_player] call aftb_staticLine_fnc_getOutMan;
 *
 * Public: No
 */

params ["_unit", "", "_vehicle", "", "_isEject"];
TRACE_3("fnc_getOutMan",_vehicle,_unit,_isEject);

if (_isEject and {[_vehicle, _unit] call FUNC(canJump)}) then {
    [_vehicle, _unit] call FUNC(jump);
};

[_vehicle, _unit] call FUNC(unhook);
nil;