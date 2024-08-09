#include "script_component.hpp"

[QGVAR(say3d), {
    params ["_object", "_sound", ["_distance", -1], ["_type", 0]];
    if (_sound == "" or {ace_player distance _object > _distance}) exitWith {};

    private _source = _object say3D [_sound, _distance, 1, _type];
    // if object is not a unit or has a parent object (i.e. unit in vehicle),
    // attach sound to object itself
    if (!(_object isKindOf "CAManBase") or !isNull objectParent _object) then {
        _source attachTo [_object];
    };
}] call CBA_fnc_addEventHandler;