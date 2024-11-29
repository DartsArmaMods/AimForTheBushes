#include "script_component.hpp"

["AllVehicles", "Init", {
    if (getNumber (configOf _this#0 >> QGVAR(isLoadable)) >= 1) then {
        // Small delay for network syncing
        [LINKFUNC(initBoat), _this, 1] call CBA_fnc_waitAndExecute;
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Air", "Init", {
    if !(_this#0 getVariable [QGVAR(3DEN_loadedBoats), false]) then {
        [LINKFUNC(3DEN_loadBoats), _this, 1] call CBA_fnc_waitAndExecute;
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;