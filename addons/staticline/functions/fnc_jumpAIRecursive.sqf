#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Waypoint function for the static line jump waypoint.
 * Based on https://github.com/acemod/ACE3/blob/master/addons/fastroping/functions/fnc_deployAIWaypoint.sqf
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Array of units <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, _unitsToDeploy] call aftb_staticLine_fnc_jumpAIRecursive;
 *
 * Public: No
 */

params ["_vehicle", "_unitsToDeploy", "_jumpInterval"];
TRACE_3("fnc_jumpAIRecursive",_vehicle,_unitsToDeploy,_jumpInterval);

private _unit = _unitsToDeploy deleteAt 0;
if (_unit in _vehicle) then {
    [_vehicle, _unit] call FUNC(jump);
};

if (_unitsToDeploy isNotEqualTo []) then {
    [{ call FUNC(jumpAIRecursive) }, _this, _jumpInterval] call CBA_fnc_waitAndExecute;
} else {
    _vehicle setVariable [QGVAR(unitsToDeploy), [], true];
};

nil;
