[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_name), LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(defaultParachute), "EDITBOX",
    [LSTRING(defaultParachute_name), LSTRING(defaultParachute_tooltip)],
    _category, "NonSteerable_Parachute_F", true
] call CBA_fnc_addSetting;

[
    QGVAR(defaultReserveParachute), "EDITBOX",
    [LSTRING(defaultReserveParachute_name), LSTRING(defaultReserveParachute_tooltip)],
    _category, "ACE_NonSteerableReserveParachute", true
] call CBA_fnc_addSetting;

[
    QGVAR(flyInHeight), "SLIDER",
    [LSTRING(flyInHeight_name), LSTRING(flyInHeight_tooltip)],
    _category, [100, 1000, 200, 0], true
] call CBA_fnc_addSetting;