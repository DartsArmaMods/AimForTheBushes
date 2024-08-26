#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit is wearing a parachute. Third party mods can technically set any backpack to be considered a parachute.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * True if unit has parachute, otherwise false <BOOL>
 *
 * Example:
 * [ace_player] call aftb_common_fnc_hasParachute;
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]]
];
TRACE_1("fnc_hasParachute",_unit);

if (isNull _unit) exitWith {};

private _backpack = backpackContainer _unit;
GVAR(parachuteCache) getOrDefaultCall [typeOf _backpack, {
    getNumber (configOf _backpack >> QGVARMAIN(isParachute)) >= 1;
}, true];