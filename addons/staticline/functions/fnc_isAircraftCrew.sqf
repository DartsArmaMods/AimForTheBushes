#include "..\script_component.hpp"
/*
 * Author: mrschick
 * Checks if a unit is in a crew position on the aircraft, to give it permission to command Group Deployments, like Jumpmasters.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Whether the unit is in the Pilot, Copilot, Gunner or Crewchief position <BOOL>
 *
 * Example:
 * [objectParent ace_player, ace_player] call aftb_staticLine_fnc_isAircraftCrew;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_isAircraftCrew",_vehicle,_unit);

if (_vehicle != objectParent _unit) exitWith {false};

private _allPositions = fullCrew [_vehicle, ""];
private _unitPositionIdx = _allPositions findIf {_x select 0 == _unit};

// See https://community.bistudio.com/wiki/fullCrew
private _unitRoleName = toLower (_allPositions select _unitPositionIdx select 1);
private _unitPositionName = toLower (_allPositions select _unitPositionIdx select 6);

(
    "driver" in _unitRoleName
) || {
    ["pilot", "loadmaster"] findIf {_x in _unitPositionName} != -1
}
