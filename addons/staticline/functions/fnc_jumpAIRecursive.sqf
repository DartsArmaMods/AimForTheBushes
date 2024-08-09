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
 * [_vehicle, _unitsToDeploy] call haf_staticLine_fnc_jumpAIRecursive;
 *
 * Public: No
 */

#define JUMP_INTERVAL 3

params ["_vehicle", "_unitsToDeploy"];
TRACE_2("fnc_jumpAI_recursive",_vehicle,_unitsToDeploy);

private _unit = _unitsToDeploy deleteAt 0;
[_vehicle, _unit] call FUNC(jump);

if (_unitsToDeploy isNotEqualTo []) then {
    [{
        _this call FUNC(jumpAIRecursive);
    }, _this, JUMP_INTERVAL] call CBA_fnc_waitAndExecute;
};

nil;