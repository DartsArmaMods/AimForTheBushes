#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Condition for the main static line jump action.
 * Requires setting to be enabled and vehicle to have static line functionality.
 *
 * Arguments:
 * 0: Vehicle <STRING or OBJECT>
 *
 * Return Value:
 * True if vehicle has static line (and setting enabled), other wise false (or setting disabled) <BOOL>
 *
 * Example:
 * [typeOf (objectParent ace_player)] call haf_staticLine_fnc_canHook;
 *
 * Public: No
 */

params [
    ["_vehicle", "", ["", objNull]]
];

if (_vehicle isEqualType objNull) then {
    _vehicle = typeOf _vehicle;
};

TRACE_1("fnc_isEnabled",_vehicle);

GVAR(enabled) and {configOf _vehicle >> QUOTE(ADDON) >> "enabled" >= 1};