#include "script_component.hpp"

["Ship_F", "Init", {
    // Small delay for network syncing
    [LINKFUNC(initBoat), _this, 1] call CBA_fnc_waitAndExecute;
}, true, [], true] call CBA_fnc_addClassEventHandler;