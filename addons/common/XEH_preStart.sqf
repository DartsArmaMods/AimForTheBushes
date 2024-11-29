#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineCommonColors.inc"

#include "XEH_PREP.hpp"

private _sideColors = [
    [Map_OPFOR_RGB, Map_OPFOR_A],
    [Map_BLUFOR_RGB, Map_BLUFOR_A],
    [Map_Independent_RGB, Map_Independent_A],
    [Map_Civilian_RGB, Map_Civilian_A],
    [Map_Unknown_RGB, Map_Unknown_A]
];

_sideColors = _sideColors apply {
    private _color = _x;
    _color = _color apply { call compile _x };
    _color;
};


uiNamespace setVariable [QGVAR(sideColors), _sideColors];