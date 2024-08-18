#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Loads a boat into a given vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Boat <OBJECT>
 *
 * Return Value:
 * True if boat was unloaded, otherwise false <BOOL>
 *
 * Example:
 * [_vehicle, _boat] call haf_helocast_fnc_loadBoat;
 *
 * Public: Yes
 */

#define UNLOAD_TIMEOUT 15

params [
    ["_vehicle", objNull, [objNull]],
    ["_boat", objNull, [objNull]]
];
TRACE_2("fnc_unloadBoat",_vehicle,_boat);

if !([_vehicle, _boat] call FUNC(canUnloadBoat)) exitWith { false; };

_vehicle setVariable [QGVAR(isUnloading), true, true];
["ace_common_blockDamage", [_vehicle, 1]] call CBA_fnc_globalEvent;
private _loadedBoats = _vehicle getVariable [QGVAR(loadedBoats), []];

private _index = (_loadedBoats find _boat);
_loadedBoats deleteAt _index;
_vehicle setVariable [QGVAR(loadedBoats), _loadedBoats, true];
detach _boat;

[{
    params ["_vehicle", "_boat"];
    if (_vehicle distance _boat >= 10) then {
        true;
    } else {
        private _positionASL = getPosASL _boat;
        private _direction = direction _vehicle;
        _positionASL = _positionASL vectorDiff [
            0.01 * sin _direction,
            0.01 * cos _direction,
            0
        ];
        _boat setPosASL _positionASL;
        false;
    };
}, {
    params ["_vehicle", "_boat", "_index"];
    [QGVAR(boatUnloaded), [_vehicle, _boat, _index]] call CBA_fnc_globalEvent;
    _vehicle setVariable [QGVAR(isUnloading), nil, true];
    ["ace_common_blockDamage", [_vehicle, 0]] call CBA_fnc_globalEvent;
}, [_vehicle, _boat, _index], UNLOAD_TIMEOUT, {
    params ["_vehicle", "_boat", "_index"];
    WARNING_4("Timed out while unloading %1 (%2) from %3 (%4). Running event anyway.",_boat,typeOf _boat,_vehicle,typeOf _vehicle);
    [QGVAR(boatUnloaded), [_vehicle, _boat, _index]] call CBA_fnc_globalEvent;
}] call CBA_fnc_waitUntilAndExecute;

if (isNull (_boat getVariable [QGVAR(marker), objNull])) then {
    private _markerClass = getText (configOf _vehicle >> QGVAR(marker));
    private _markerOffset = getArray (configOf _boat >> QGVAR(markerOffset));
    if (_markerOffset isEqualTo []) then {
        _markerOffset = [0, 0, 0];
    };

    private _marker = createSimpleObject [_markerClass, [0, 0, 0]];
    _marker attachTo [_boat, _markerOffset];
    _boat setVariable [QGVAR(marker), _marker, true];
};

[_boat, QGVAR(unloadBoat)] call EFUNC(common,say3D);
true;