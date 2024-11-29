#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _loadableBoats = toString {
    getNumber (_x >> "scope") == 2 && getNumber (_x >> QGVAR(isLoadable)) >= 1
} configClasses (configFile >> "CfgVehicles");
_loadableBoats = _loadableBoats apply { configName _x };

uiNamespace setVariable [QGVAR(loadableBoats), compileFinal (_loadableBoats createHashMapFromArray [])];