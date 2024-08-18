[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_name), LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(loadDistance), "SLIDER",
    [LSTRING(loadDistance_name), LSTRING(loadDistance_tooltip)],
    _category, [1, 20, 7, 0], true
] call CBA_fnc_addSetting;