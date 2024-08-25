#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Waypoint function for the static line jump waypoint.
 * Based on https://github.com/acemod/ACE3/blob/master/addons/fastroping/functions/fnc_deployAIWaypoint.sqf
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Create new group for jumpers (optional, default: setting) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call aftb_staticLine_fnc_jumpAI;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_createGroup", GVAR(createGroup), [true]]
];
TRACE_2("fnc_jumpAI",_vehicle,_createGroup);

if (!alive _vehicle or getNumber (configOf _vehicle >> QGVAR(enabled)) < 1) exitWith {};

private _unitsToDeploy = [_vehicle] call EFUNC(common,getPassengers);

if !(GVAR(aiDeployPlayers)) then {
    _unitsToDeploy = _unitsToDeploy select {!isPlayer _x};
};

if (_unitsToDeploy isEqualTo []) exitWith {};

if (_createGroup) then {
    private _group = createGroup side (_unitsToDeploy#0);
    _unitsToDeploy joinSilent _group;
};

_vehicle setVariable [QGVAR(unitsToDeploy), _unitsToDeploy, true];

// Thanks Baer
private _time = START_POS_DISTANCE / ((speed _vehicle) / 3.6);
private _jumpInterval = _time / (count _unitsToDeploy);
[_vehicle, _unitsToDeploy, _jumpInterval] call FUNC(jumpAIRecursive);