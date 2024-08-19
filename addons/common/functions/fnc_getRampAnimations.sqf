#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Returns the configured ramp animation for a given vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Ramp animation <ARRAY>
 *  0: Animation name <STRING>
 *  1: Closed state <NUMBER>
 *  2: Opened state <NUMBER>
 *
 * Example:
 * [_vehicle] call haf_common_fnc_getRampAnimations;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]]
];
TRACE_1("fnc_getRampAnimations",_vehicle);

private _rampAnims = _vehicle getVariable [QGVARMAIN(rampAnims), []];
if (_rampAnims isNotEqualTo []) exitWith { _rampAnims; };

_rampAnims = getArray (configOf _vehicle >> QGVARMAIN(rampAnims));
_rampAnims = _rampAnims apply {
    _x params ["_anim", ["_closed", 0], ["_opened", 1]];
    [_anim, _closed, _opened];
};

_vehicle setVariable [QGVARMAIN(rampAnims), _rampAnims];
_rampAnims;