#include "script_component.hpp"

// Max time in seconds to try unloading a boat for.
// If timeout is reached, boat is unloaded anyway.
GVAR(const_unloadTimeout) = 15;
GVAR(const_autoLoadDistance) = 2;

["AllVehicles", "Init", {
    if (getNumber (configOf (_this#0) >> QGVAR(isLoadable)) < 1) exitWith {};
    // Small delay for network syncing
    [LINKFUNC(initBoat), _this, 1] call CBA_fnc_waitAndExecute;
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QGVAR(boatLoaded), {
    params ["_vehicle", "_boat", "_index"];
    [QEGVAR(common,disableCollision), [_boat]] call CBA_fnc_localEvent;
    ["ace_common_blockDamage", [_boat, 1]] call CBA_fnc_localEvent;
    ["ace_common_blockEngine", [_boat, 1]] call CBA_fnc_localEvent;
    ["ace_common_lockVehicle", _boat] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(boatUnloaded), {
    params ["_vehicle", "_boat", "_index"];
    [QEGVAR(common,enableCollision), [_boat]] call CBA_fnc_localEvent;
    ["ace_common_blockDamage", [_boat, 0]] call CBA_fnc_localEvent;
    ["ace_common_blockEngine", [_boat, 0]] call CBA_fnc_localEvent;
    ["ace_common_unlockVehicle", _boat] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;