class CfgWaypoints {
    class PREFIX {
        displayName = QUOTE(MOD_NAME);
        class StaticLineJump {
            displayName = CSTRING(displayName);
            displayNameDebug = "Static Line Jump";
            file = QPATHTOF(functions\fnc_jumpAIWaypoint.sqf);
            icon = "\a3\ui_f\data\map\vehicleicons\iconparachute_ca.paa";
        };
    };
};
