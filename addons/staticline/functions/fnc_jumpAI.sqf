#include "..\script_component.hpp"
/*
 * Author: DartRuffian, mrschick
 * Waypoint function for the static line jump waypoint.
 * Based on https://github.com/acemod/ACE3/blob/master/addons/fastroping/functions/fnc_deployAIWaypoint.sqf
 * Is also used for groupDeployments, commanded by Jumpmasters.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Create new group for jumpers (optional, default: setting) <BOOL>
 * 2: Explicit list of units to deploy (optional, default: ["all"]) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _vehicle call aftb_staticLine_fnc_jumpAI;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_createGroup", GVAR(createGroup), [true]],
    ["_unitsToDeploy", ["all"], [[]]]
];
TRACE_3("fnc_jumpAI",_vehicle,_createGroup,_unitsToDeploy);

if (!alive _vehicle || {getNumber (configOf _vehicle >> QGVAR(enabled)) < 1}) exitWith {};

private _jumpInterval = 1;

if (_unitsToDeploy isEqualTo ["all"]) then {
    // Default behaviour via AI waypoint, deploying all passengers
    if (_unitsToDeploy isEqualTo []) then {
        _unitsToDeploy = _vehicle call EFUNC(common,getPassengers);
    };

    if !(GVAR(aiDeployPlayers)) then {
        _unitsToDeploy = _unitsToDeploy select {!isPlayer _x};
    };

    // Spread jumps evenly over 2km, Thanks Baer!
    private _unitCount = count _unitsToDeploy;
    if (_unitCount > 0) then {
        private _time = START_POS_DISTANCE / ((speed _vehicle) / 3.6);
        _jumpInterval = _time / _unitCount;
    };
};

// Abort on empty unit list
if (_unitsToDeploy isEqualTo []) exitWith {};

if (_createGroup) then {
    private _group = createGroup side (_unitsToDeploy#0);
    _unitsToDeploy joinSilent _group;
};

_vehicle setVariable [QGVAR(unitsToDeploy), _unitsToDeploy, true];

[_vehicle, _unitsToDeploy, _jumpInterval] call FUNC(jumpAIRecursive);
