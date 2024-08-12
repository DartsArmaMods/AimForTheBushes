#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Waypoint function for the static line jump waypoint.
 * Based on https://github.com/acemod/ACE3/blob/master/addons/fastroping/functions/fnc_deployAIWaypoint.sqf
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
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
    ["_vehicle", objNull, [objNull]]
];
TRACE_2("fnc_jumpAI",_vehicle,_createGroup);

private _config = configOf _vehicle >> QUOTE(ADDON);
if (!alive _vehicle or getNumber (_config >> "enabled") < 1) exitWith {};

private _unitsToDeploy = [_vehicle] call EFUNC(common,getPassengers);

if !(GVAR(aiDeployPlayers)) then {
    _unitsToDeploy = _unitsToDeploy select {!isPlayer _x};
};

if (_unitsToDeploy isEqualTo []) exitWith {};

private _group = createGroup side (_unitsToDeploy#0);
_unitsToDeploy joinSilent _group;

_vehicle setVariable [QGVAR(unitsToDeploy), _unitsToDeploy, true];

// Thanks Baer
private _time = START_POS_DISTANCE / ((speed _vehicle) / 3.6);
private _jumpInterval = _time / (count _unitsToDeploy);
[_vehicle, _unitsToDeploy, _jumpInterval] call FUNC(jumpAIRecursive);