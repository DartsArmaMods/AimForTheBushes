#include "script_component.hpp"

["AllVehicles", "Init", {
    private _vehicle = _this select 0;
    if (getNumber (configOf _vehicle >> QGVAR(isLoadable)) >= 1) then {
        // Small delay for network syncing
        [LINKFUNC(initBoat), _this, 1] call CBA_fnc_waitAndExecute;
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Air", "Init", {
    private _vehicle = _this select 0;
    if !(_vehicle getVariable [QGVAR(3DEN_loadedBoats), false]) then {
        [LINKFUNC(3DEN_loadBoats), _this, 1] call CBA_fnc_waitAndExecute;
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;
