#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Handles the onLoad for the boatCount attribute
 *
 * Arguments:
 * 0: Control group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _ctrlGroup call aftb_helocast_fnc_3DEN_boatCountOnLoad;
 *
 * Public: No
 */

params ["_ctrl"];
TRACE_1("fnc_3DEN_boatCountOnLoad",_ctrl);

private _vehicle = (get3DENSelected "object") select 0;
private _boatPositions = getArray (configOf _vehicle >> QGVAR(boatPositions));
if (_boatPositions isEqualTo []) exitWith {
    private _ctrlParent = ctrlParentControlsGroup _ctrl;
    _ctrlParent ctrlShow false;
};

lbClear _ctrl;

for "_i" from 0 to count _boatPositions do {
    private _strI = str _i;
    private _lbAdd = _ctrl lbAdd _strI;
    _ctrl lbSetData [_lbAdd, _strI];
};

_ctrl lbSetCurSel 0;

nil;
