#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Returns the configured ramp animation for a given vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT or STRING>
 *
 * Return Value:
 * Ramp animation <ARRAY>
 *  0: Animation name <STRING>
 *  1: Closed state <NUMBER>
 *  2: Opened state <NUMBER>
 *
 * Example:
 * [_vehicle] call haf_common_fnc_getRampAnimation;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull, ""]]
];

if (_vehicle isEqualType objNull) then {
    _vehicle = typeOf _vehicle;
};

TRACE_1("fnc_getRampAnimation",_vehicle);

getArray (configFile >> "CfgVehicles" >> _vehicle >> QGVARMAIN(rampAnim)) params ["_anim", ["_closed", 0], ["_opened", 1]];
[_anim, _closed, _opened];