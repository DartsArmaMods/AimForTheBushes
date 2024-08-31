#include "script_component.hpp"

GVAR(parachuteCache) = createHashMapFromArray [["", false]];

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

STATUS_WRAPPER(blockDamage);
STATUS_WRAPPER(blockEngine);

// Manually done to change the name
[QGVAR(lockVehicle), {
    params ["_object", "_reason", "_set"];
    [_object, "disableWeaponAssembly", _reason, _set] call ace_common_fnc_statusEffect_set;
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    call COMPILE_SCRIPT(XEH_postInitClient);
};