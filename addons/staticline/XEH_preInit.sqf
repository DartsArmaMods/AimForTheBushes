#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"

[QGVAR(jump), LINKFUNC(jump)] call CBA_fnc_addEventHandler;

// Keep the player's assignedTeam updated as a public object variable. Otherwise, clients in a different group cannot fetch our assignedTeam, causing locality issues for group deployments.
[{
    private _assignedTeam = assignedTeam ace_player;
    if (_assignedTeam != (ace_player getVariable [QGVAR(assignedTeam), "MAIN"])) then {
        ace_player setVariable [QGVAR(assignedTeam), _assignedTeam, true];
    };
}, 1] call CBA_fnc_addPerFrameHandler;
