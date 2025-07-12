#ifdef DEBUG_MODE_FULL
// Work in progress, AI have issues flying with an object inside the helo
class CfgWaypoints {
    class PREFIX {
        displayName = QUOTE(MOD_NAME);
        class Helocast {
            displayName = CSTRING(displayName);
            displayNameDebug = "Helocast";
            file = QPATHTOF(functions\fnc_helocastAIWaypoint.sqf);
            icon = "\a3\ui_f\data\igui\cfg\simpletasks\types\boat_ca.paa"; // TODO: Find/make better icon
        };
    };
};
#endif
