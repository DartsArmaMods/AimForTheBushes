class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_GetOutMan_EventHandlers {
    class CAManBase {
        class ADDON {
            getOutMan = QUOTE((_this select 0) setVariable [ARR_3(QQGVAR(isHooked),nil,true)]);
        };
    };
};