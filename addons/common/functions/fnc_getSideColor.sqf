#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Gives the color of a given side.
 *
 * Arguments:
 * 0: Side <NUMBER>
 *    - 0: OPFOR
 *    - 1: BLUFOR
 *    - 2: Independent
 *    - 3: Civilian
 *    - Anything else: Unknown
 *
 * Return Value:
 * Color in format [R, G, B, A] <ARRAY>
 *
 * Example:
 * 0 call aftb_common_fnc_getSideColor;
 *
 * Public: No
 */

params ["_side"];
TRACE_1("fnc_getSideColor",_side);

if (_side > 3 || _side < 0) then {
    _side = 4;
};

GVAR(sideColors) select _side;