#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"

GVAR(loadableBoats) = keys (uiNamespace getVariable QGVAR(loadableBoats));
GVAR(const_autoLoadDistance) = 3;

[QGVAR(boatLoaded), {
    params ["", "_boat"];
    [QEGVAR(common,disableCollision), [_boat]] call CBA_fnc_localEvent;
    [QEGVAR(common,blockDamage), [_boat, QGVAR(boatIsLoaded), true]] call CBA_fnc_localEvent;
    [QEGVAR(common,blockEngine), [_boat, QGVAR(boatIsLoaded), true]] call CBA_fnc_localEvent;
    [QEGVAR(common,lockVehicle), [_boat, QGVAR(boatIsLoaded), true]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(boatUnloaded), {
    params ["", "_boat"];
    [QEGVAR(common,enableCollision), [_boat]] call CBA_fnc_localEvent;
    [QEGVAR(common,blockDamage), [_boat, QGVAR(boatIsLoaded), false]] call CBA_fnc_localEvent;
    [QEGVAR(common,blockEngine), [_boat, QGVAR(boatIsLoaded), false]] call CBA_fnc_localEvent;
    [QEGVAR(common,lockVehicle), [_boat, QGVAR(boatIsLoaded), false]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(unloadBoatPFH), LINKFUNC(unloadBoatPFH)] call CBA_fnc_addEventHandler;
