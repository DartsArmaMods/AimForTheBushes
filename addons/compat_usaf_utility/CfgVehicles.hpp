class CfgVehicles {
    class Plane_Base_F;
    class USAF_C130J_Base: Plane_Base_F {
        GVARMAIN(rampAnims)[] = {
            {"ramp_top", 0, 1},
            {"ramp_bottom", 0, 0.5}
        };

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class USAF_C130J: USAF_C130J_Base {};
    class USAF_C130J_Cargo: USAF_C130J {
        EGVAR(staticLine,enabled) = 0;
    };

    class USAF_C17: Plane_Base_F {
        GVARMAIN(rampAnims)[] = {
            {"back_ramp", 0, 1}
        };

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};
