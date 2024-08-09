#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Waypoint function for the static line jump waypoint.
 * Based on https://github.com/acemod/ACE3/blob/master/addons/fastroping/functions/fnc_deployAIWaypoint.sqf
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Create new group for AI (optional, default: true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call haf_staticLine_fnc_jumpAI;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_createGroup", true, [true]]
];
TRACE_2("fnc_jumpAI",_vehicle,_createGroup);

private _config = configOf _vehicle >> QUOTE(ADDON);
if (!alive _vehicle or getNumber (_config >> "enabled") < 1) exitWith {};

private _passengerTurrets = getArray (_config >> "passengerTurrets");

private _unitsToDeploy = fullCrew _vehicle select {
    _x params ["_unit", "_role", "", "_turretPath"];
    _role == "cargo" or {_turretPath in _passengerTurrets};
} apply { _x#0 };

if (_unitsToDeploy isEqualTo []) exitWith {};

if (_createGroup) then {
    private _group = createGroup side (_unitsToDeploy#0);
    _unitsToDeploy joinSilent _group;
};

_vehicle setVariable [QGVAR(unitsToDeploy), _unitsToDeploy, true];

[_vehicle, _unitsToDeploy] call FUNC(jumpAIRecursive);