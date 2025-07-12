[
    QGVAR(enabled), "CHECKBOX",
    [localize "STR_ACE_Common_Enabled", LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(aiDeployPlayers), "CHECKBOX",
    [LSTRING(aiDeployPlayers_name), LSTRING(aiDeployPlayers_tooltip)],
    _category, false, true
] call CBA_fnc_addSetting;

[
    QGVAR(createGroup), "CHECKBOX",
    [LSTRING(createGroup_name), LSTRING(createGroup_tooltip)],
    _category, false, true
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
    QGVAR(parachuteDelay), "SLIDER",
    [LSTRING(parachuteDelay_name), LSTRING(parachuteDelay_tooltip)],
    _category, [2, 10, 4, 2], true
] call CBA_fnc_addSetting;
