#define START_POS_DISTANCE 2000

#define MAIN_ACTION class ADDON { \
    displayName = CSTRING(action_staticLine); \
    condition = QUOTE([_target] call FUNC(isEnabled) and {_player in ([_target] call FUNC(getPassengers))}); \
    statement = ""; \
    icon = ""; \
    class GVAR(hook) { \
        displayName = CSTRING(action_hook); \
        condition = QUOTE(call FUNC(canHook)); \
        statement = QUOTE(call FUNC(hook)); \
        icon = "\a3\3den\data\cfgwaypoints\hook_ca.paa"; \
    }; \
    class GVAR(unhook) { \
        displayName = CSTRING(action_unhook); \
        condition = QUOTE(call FUNC(canUnhook)); \
        statement = QUOTE(call FUNC(unhook)); \
        icon = "\a3\3den\data\cfgwaypoints\unhook_ca.paa"; \
    }; \
    class GVAR(jump) { \
        displayName = CSTRING(action_jump); \
        condition = QUOTE(call FUNC(canJump)); \
        statement = QUOTE(call FUNC(jump)); \
        icon = "\a3\ui_f\data\map\vehicleicons\iconparachute_ca.paa"; \
    }; \
}