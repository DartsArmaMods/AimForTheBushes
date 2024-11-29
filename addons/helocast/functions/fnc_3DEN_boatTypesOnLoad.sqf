#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Handles the onLoad for the boatTypes attribute
 *
 * Arguments:
 * 0: Control group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _ctrlGroup call aftb_helocast_fnc_3DEN_boatTypesOnLoad;
 *
 * Public: No
 */

params ["_ctrl"];
TRACE_1("fnc_3DEN_boatTypesOnLoad",_ctrl);

private _vehicle = (get3DENSelected "object") select 0;
if (getArray (configOf _vehicle >> QGVAR(boatPositions)) isEqualTo []) exitWith {
    private _ctrlParent = ctrlParentControlsGroup _ctrl;
    _ctrlParent ctrlShow false;
};

lbClear _ctrl;

{
    private _vehicleConfig = configFile >> "CfgVehicles" >> _x;
    private _vehicleName = getText (_vehicleConfig >> "displayName");

    private _factionConfig = configFile >> "CfgFactionClasses" >> (getText (_vehicleConfig >> "faction"));
    private _factionName = getText (_factionConfig >> "displayName");
    private _factionIcon = getText (_factionConfig >> "icon");

    private _lbAdd = _ctrl lbAdd format ["%1 [%2]", _vehicleName, _factionName];
    _ctrl lbSetData [_lbAdd, _x];

    // If no faction icon is set, use the side color
    if (_factionIcon == "") then {
        _texture = ["#(rgb,1,1,1)color(%1,%2,%3,%4)"];
        _texture append ((getNumber (_vehicleConfig >> "side")) call EFUNC(common,getSideColor));
        _factionIcon = format _texture;
        TRACE_2("Missing faction icon, using side color",_factionIcon,_texture);
    };

    _ctrl lbSetPicture [_forEachIndex, _factionIcon];
} forEach GVAR(loadableBoats);

_ctrl lbSetCurSel 0;

nil;