#define BOAT_LOAD_DISTANCE 7

#define MAIN_ACTION class ADDON { \
    displayName = CSTRING(action_helocast); \
    condition = QUOTE([ARR_2(_target,_player)] call EFUNC(common,isPilot)); \
    statement = ""; \
    icon = ""; \
    class GVAR(unloadBoat) { \
        displayName = CSTRING(action_unloadBoats); \
        condition = QUOTE(true); \
        statement = ""; \
        insertChildren = QUOTE(call FUNC(unloadBoat_insertChildren)); \
    }; \
}