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

private _unitsToDeploy = [_vehicle] call FUNC(getPassengers);

if !(GVAR(aiDeployPlayers)) then {
    _unitsToDeploy = _unitsToDeploy select {!isPlayer _x};
};

if (_unitsToDeploy isEqualTo []) exitWith {};

private _group = createGroup side (_unitsToDeploy#0);
_unitsToDeploy joinSilent _group;

_vehicle setVariable [QGVAR(unitsToDeploy), _unitsToDeploy, true];

/*
 * Formula was done by using speed and a tested interval value, and finding the slope between two points.
 * This isn't perfect, but works good enough.
 * 400 km/h @ 0.5 seconds
 * 170 km/h @ 2 seconds
 */
private _jumpInterval = (-0.0065217391304348 * speed _vehicle) + 3.1086956521739;
[_vehicle, _unitsToDeploy, _jumpInterval] call FUNC(jumpAIRecursive);