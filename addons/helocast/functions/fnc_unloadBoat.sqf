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

params [
    ["_vehicle", objNull, [objNull]],
    ["_boat", objNull, [objNull]]
];
TRACE_2("fnc_unloadBoat",_vehicle,_boat);

if !([_vehicle, _boat] call FUNC(canUnloadBoat)) exitWith { false; };

private _loadedBoats = _vehicle getVariable [QGVAR(loadedBoats), []];

private _index = (_loadedBoats find _boat);
_loadedBoats deleteAt _index;
_vehicle setVariable [QGVAR(loadedBoats), _loadedBoats, true];

// TODO: Slowly move boat out of vehicle rather than instant teleport

private _positionASL = getPosASL _boat;
private _direction = direction _vehicle;
_positionASL = _positionASL vectorDiff [
    15 * sin _direction,
    15 * cos _direction,
    0
];

if (isNull (_boat getVariable [QGVAR(marker), objNull])) then {
    private _markerClass = getText (configOf _vehicle >> QGVAR(marker));
    private _markerClass = "Chemlight_green";
    private _markerOffset = getArray (configOf _boat >> QGVAR(markerOffset));
    if (_markerOffset isEqualTo []) then {
        _markerOffset = [0, 0, 0];
    };

    private _marker = createSimpleObject [_markerClass, _positionASL];
    _marker attachTo [_boat, _markerOffset];
    _boat setVariable [QGVAR(marker), _marker, true];
};

_boat setPosASL _positionASL;

[QEGVAR(common,enableCollision), [_boat]] call CBA_fnc_globalEvent;
["ace_common_blockDamage", [_boat, 0]] call CBA_fnc_globalEvent;
["ace_common_blockEngine", [_boat, 0]] call CBA_fnc_globalEvent;
["ace_common_unlockVehicle", _boat] call CBA_fnc_globalEvent;

detach _boat;

[_boat, QGVAR(unloadBoat)] call EFUNC(common,say3D);
[QGVAR(boatUnloaded), [_vehicle, _boat, _index]] call CBA_fnc_globalEvent;
true;