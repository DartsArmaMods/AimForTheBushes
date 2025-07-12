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
 * [_vehicle, _boat] call aftb_helocast_fnc_unloadBoat;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_boat", objNull, [objNull]]
];
TRACE_2("fnc_unloadBoat",_vehicle,_boat);

if !([_vehicle, _boat] call FUNC(canUnloadBoat)) exitWith { false; };

_vehicle setVariable [QGVAR(isUnloading), true, true];
[QEGVAR(common,blockDamage), [_vehicle, QGVAR(isUnloadingBoat), true]] call CBA_fnc_globalEvent;
private _loadedBoats = _vehicle getVariable [QGVAR(loadedBoats), []];

private _index = (_loadedBoats find _boat);
_loadedBoats deleteAt _index;
_vehicle setVariable [QGVAR(loadedBoats), _loadedBoats, true];

[_vehicle, _boat] call FUNC(unloadBoatPFH);

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
