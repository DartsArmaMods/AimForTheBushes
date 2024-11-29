#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(sideColors) = uiNamespace getVariable QGVAR(sideColors);
GVAR(rampAnimationsCache) = createHashMap;
GVAR(parachuteCache) = createHashMapFromArray [["", false]];