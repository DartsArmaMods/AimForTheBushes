#define MAIN_ACTION class ADDON { \
    displayName = CSTRING(category_displayName); \
    condition = QUOTE(GVAR(enabled)); \
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