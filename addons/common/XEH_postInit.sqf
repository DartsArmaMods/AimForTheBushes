#include "script_component.hpp"

[QGVAR(disableCollision), {
    params ["_object"];
    _object setVariable [QGVAR(originalMass), getMass _object];
    _object setMass 1e-12;
}] call CBA_fnc_addEventHandler;

[QGVAR(enableCollision), {
    params ["_object"];
    private _mass = _object getVariable [QGVAR(originalMass), getMass _object];
    _object setVariable [QGVAR(originalMass), nil];
    _object setMass _mass;
}] call CBA_fnc_addEventHandler;

[QGVAR(blockDamage), {
    params ["_object", "_reason", "_set"];
    [_object, "blockDamage", _reason, _set] call ace_common_fnc_statusEffect_set;
}] call CBA_fnc_addEventHandler;

[QGVAR(blockEngine), {
    params ["_object", "_reason", "_set"];
    [_object, "blockEngine", _reason, _set] call ace_common_fnc_statusEffect_set;
}] call CBA_fnc_addEventHandler;

[QGVAR(lockVehicle), {
    params ["_object", "_reason", "_set"];
    [_object, "disableWeaponAssembly", _reason, _set] call ace_common_fnc_statusEffect_set;
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    call COMPILE_SCRIPT(XEH_postInitClient);
};
