#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Loads a boat into a given vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Boat <OBJECT>
 * 2: Move boat crew into vehicle (optional, default: true) <BOOL>
 * 3: Index (optional, default: first found) <NUMBER>
 * 4: Ignore ramp (optional, default: false) <BOOL>
 *    - If true, the ramp's animation state will be ignored
 *
 * Return Value:
 * True if boat was loaded, otherwise false <BOOL>
 *
 * Example:
 * [_vehicle, _boat] call aftb_helocast_fnc_loadBoat;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_boat", objNull, [objNull]],
    ["_moveIntoVehicle", true, [true]],
    ["_index", -1, [0]],
    ["_ignoreRamp", false, [false]]
];
TRACE_5("fnc_loadBoat",_vehicle,_boat,_moveIntoVehicle,_index,_ignoreRamp);

// Boats loaded via Eden init did not have damage disabled
if (CBA_missionTime < 1) exitWith {
    TRACE_1("loadBoat called too soon, delay until CBA_missionTime >= 1");
    [{CBA_missionTime >= 1}, FUNC(loadBoat), _this] call CBA_fnc_waitUntilAndExecute;
};

// This technically doubles up on the condition when using the recover boat action,
// However the second instance will be faster due to _vehicle already being known
if !([_boat, _vehicle, nil, _ignoreRamp] call FUNC(canLoadBoat)) exitWith { false; };

private _boatPositions = getArray (configOf _vehicle >> QGVAR(boatPositions));
private _loadedBoats = _vehicle getVariable [QGVAR(loadedBoats), []];

if (_index < 0) then {
    {
        private _loadedBoat = _loadedBoats select _forEachIndex;
        if (isNil "_loadedBoat") exitWith {
            _index = _forEachIndex;
        };
    } forEach _boatPositions;
};

_loadedBoats set [_index, _boat];
_vehicle setVariable [QGVAR(loadedBoats), _loadedBoats, true];
_boat attachTo [_vehicle, _boatPositions select _index];

if (_moveIntoVehicle) then {
    {
        if (_vehicle emptyPositions "Cargo" == 0) exitWith {};
        moveOut _x;
        _x moveInCargo _vehicle;
    } forEach (crew _boat);
};

[_boat, QGVAR(loadBoat)] call EFUNC(common,say3D);
[QGVAR(boatLoaded), [_vehicle, _boat, _index]] call CBA_fnc_globalEvent;
true;