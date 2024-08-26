#include "..\script_component.hpp"
/*
 * Author: Dart
 * Checks if a given unit is current pilot OR copilot of a specific vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * True if unit is (co)pilot, otherwise false <BOOL>
 *
 * Example:
 * [_vehicle, _unit] call aftb_common_fnc_isPilot
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];
TRACE_2("fnc_isPilot",_vehicle,_unit);

if (isNull _vehicle or {isNull _unit}) exitWith {};

_unit == currentPilot _vehicle or {
    private _turretConfig = _vehicle unitTurret _unit;
    _turretConfig = ([typeOf _vehicle, _turretConfig] call BIS_fnc_turretConfig);
    getNumber (_turretConfig >> "isCopilot") > 1;
};