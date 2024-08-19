#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"DartRuffian"};
        url = ECSTRING(main,url);
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "haf_main",
            "haf_common",
            "haf_staticLine",
            "haf_helocast"
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};