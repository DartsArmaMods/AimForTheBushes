#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"DartRuffian"};
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "haf_loadOrder",
            "rhssaf_main_loadorder"
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"