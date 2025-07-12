#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Returns a list of passenger units for the given vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Array of passenger units <ARRAY>
 *
 * Example:
 * _vehicle call aftb_common_fnc_getPassengers
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]]
];
TRACE_1("fnc_getPassengers",_vehicle);

private _passengerTurrets = getArray (configOf _vehicle >> QGVARMAIN(passengerTurrets));
private _passengers = fullCrew _vehicle select {
    _x params ["", "_role", "", "_turretPath"];
    _role == "cargo" or {_turretPath in _passengerTurrets} or {
        private _turretConfig = [_vehicle, _turretPath] call CBA_fnc_getTurret;
        getNumber (_turretConfig >> "showAsCargo") == 1 and {getNumber (_turretConfig >> "isPersonTurret") == 1};
    };
} apply { _x#0 };
_passengers;
