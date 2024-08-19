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

// _vehicle param needs to be second and optional for recover boat UserAction
params ["_boat", ["_vehicle", objNull]];
TRACE_2("fnc_canLoadBoat",_boat,_vehicle);

private _positionAGL = ASLToAGL getPosASL _boat;
if (isNull _vehicle) then {
    _vehicle = (nearestObjects [_positionAGL, ["Helicopter"], GVAR(loadDistance)]) select {
        alive _x;
    } select 0;
};

if (getNumber (configOf _boat >> QGVAR(isLoadable)) < 1 or {
    [_vehicle] call EFUNC(common,getRampAnimation) params ["_anim", "", "_open"];
    _vehicle animationSourcePhase _anim != _open;
}) exitWith { false; };

private _boatPositions = getArray (configOf _vehicle >> QGVAR(boatPositions));
private _loadedBoats = _vehicle getVariable [QGVAR(loadedBoats), []];

if ((_loadedBoats isEqualTo [] and {_boatPositions isNotEqualTo []}) or {
    count _loadedBoats < count _boatPositions
}) exitWith {
    _boat setVariable [QGVAR(loadTarget), _vehicle];
    true;
};

false;