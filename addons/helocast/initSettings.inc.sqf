[
    QGVAR(enabled), "CHECKBOX",
    [localize "STR_ACE_Common_Enabled", LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(loadDistance), "SLIDER",
    [LSTRING(loadDistance_name), LSTRING(loadDistance_tooltip)],
    _category, [1, 20, 7, 2], true
] call CBA_fnc_addSetting;