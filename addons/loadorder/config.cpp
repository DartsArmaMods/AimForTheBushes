#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"DartRuffian"};
        url = ECSTRING(main,url);
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "aftb_main",
            "aftb_common",
            "aftb_staticLine",
            "aftb_helocast"
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};
