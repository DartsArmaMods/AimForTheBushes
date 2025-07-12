#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a boat can be loaded into the closest helicopter.
 *
 * Arguments:
 * 0: Boat <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Automatically load if close enough (optional, default: false) <BOOL>
 * 3: Ignore ramp state (optional, default: false) <BOOL>
 *
 * Return Value:
 * True if boat can be loaded, otherwise false <BOOL>
 *
 * Example:
 * _boat call aftb_helocast_fnc_canLoadBoat;
 *
 * Public: No
 */

// _vehicle param needs to be second and optional for recover boat UserAction
params ["_boat", ["_vehicle", objNull], ["_autoLoad", false], ["_ignoreRamp", false]];
TRACE_4("fnc_canLoadBoat",_boat,_vehicle,_autoLoad,_ignoreRamp);

private _positionAGL = ASLToAGL getPosASL _boat;
if (isNull _vehicle) then {
    _vehicle = (nearestObjects [_positionAGL, ["Air"], GVAR(loadDistance)]) select {
        alive _x;
    } select 0;
};

if (getNumber (configOf _boat >> QGVAR(isLoadable)) < 1) exitWith { false };

private _boatPositions = getArray (configOf _vehicle >> QGVAR(boatPositions));
private _loadedBoats = _vehicle getVariable [QGVAR(loadedBoats), []];

if ((_loadedBoats isEqualTo [] and {_boatPositions isNotEqualTo []}) or
{count _loadedBoats < count _boatPositions} or {
    _ignoreRamp or {(_vehicle call EFUNC(common,isRampOpen))}
}) exitWith {
    _boat setVariable [QGVAR(loadTarget), _vehicle];
    if (_autoLoad and {_vehicle distance _boat <= GVAR(const_autoLoadDistance)}) then {
        [_vehicle, _boat] call FUNC(loadBoat);
    };

    true;
};

false;
