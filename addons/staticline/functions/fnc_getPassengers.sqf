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
 * [_vehicle] call haf_staticLine_fnc_getPassengers
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]]
];
TRACE_1("fnc_getPassengers",_vehicle);

private _passengerTurrets = getArray (configOf _vehicle >> QUOTE(ADDON) >> "passengerTurrets");
private _passengers = fullCrew _vehicle select {
    _x params ["", "_role", "", "_turretPath"];
    _role == "cargo" or {_turretPath in _passengerTurrets};
} apply { _x#0 };
_passengers;