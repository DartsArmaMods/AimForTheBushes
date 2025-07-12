class CfgVehicles {
    class Plane_Base_F;
    class USAF_AC130U_base: Plane_Base_F {
        GVARMAIN(rampAnims)[] = {
            {"ramp_top", 0, 1},
            {"ramp_bottom", 0, 1}
        };

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};
