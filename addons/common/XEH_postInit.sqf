#include "script_component.hpp"

GVAR(parachuteCache) = createHashMapFromArray [["", false]];

if (hasInterface) then {
    call COMPILE_SCRIPT(XEH_postInitClient);
};