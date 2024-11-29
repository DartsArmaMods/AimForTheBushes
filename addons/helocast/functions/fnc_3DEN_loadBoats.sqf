#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Loads boats that are set via Eden.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _vehicle call aftb_helocast_fnc_3DEN_loadBoats;
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("fnc_3DEN_loadBoats",_vehicle);

private _boatClass = _vehicle getVariable [QGVAR(boatType), ""];
private _boatCount = parseNumber (_vehicle getVariable [QGVAR(boatCount), "0"]);

if (_boatClass == "" || _boatCount < 1) exitWith {};
_vehicle setVariable [QGVAR(3DEN_loadedBoats), true, true];

for "_i" from 1 to _boatCount do {
    private _boat = createVehicle [_boatClass, [0, 0, 0], [], 0, "CAN_COLLIDE"];
    private _return = [_vehicle, _boat, nil, nil, true] call FUNC(loadBoat);
    if (!_return) exitWith {
        TRACE_2("Failed to load boat from Eden property",_vehicle,_boatClass);
        deleteVehicle _boat;
    };
};