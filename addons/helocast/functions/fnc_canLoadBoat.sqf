#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a boat can be loaded into the closest helicopter.
 *
 * Arguments:
 * 0: Boat <OBJECT>
 *
 * Return Value:
 * True if boat can be loaded, otherwise false <BOOL>
 *
 * Example:
 * [_boat] call haf_helocast_fnc_canLoadBoat;
 *
 * Public: No
 */

params ["_boat", ["_vehicle", objNull]];
TRACE_2("fnc_canLoadBoat",_boat,_vehicle);

[_vehicle] call EFUNC(common,getRampAnimation) params ["_anim", "", "_open"];
if (_vehicle animationSourcePhase _anim != _open) exitWith { false; };

private _positionAGL = ASLToAGL getPosASL _boat;

// _vehicle param needs to be optional for recover boat UserAction
if (isNull _vehicle) then {
    _vehicle = (nearestObjects [_positionAGL, ["Helicopter"], BOAT_LOAD_DISTANCE]) select {
        alive _x;
    } select 0;
};

private _boatPositions = getArray (configOf _vehicle >> QGVAR(boatPositions));
private _loadedBoats = _vehicle getVariable [QGVAR(loadedBoats), []];

if ((_loadedBoats isEqualTo [] and {_boatPositions isNotEqualTo []}) or {
    count _loadedBoats < count _boatPositions
}) exitWith {
    _boat setVariable [QGVAR(loadTarget), _vehicle];
    true;
};

false;