class CfgVehicles {
    class Plane;
    class sab_C130_J_Base: Plane {
        GVARMAIN(rampAnims)[] = {
            {"ramp_top", 0, 1},
            {"ramp_bottom", 0, 1}
        };

        EGVAR(staticLine,enabled) = 0;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
    class sab_C130_J: sab_C130_J_Base {
        EGVAR(staticLine,enabled) = 1;
    };
};