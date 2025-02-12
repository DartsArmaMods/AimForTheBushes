class CfgVehicles {
    class VTOL_01_base_F;
    class UK3CB_Osprey_Base: VTOL_01_base_F {
        GVARMAIN(rampAnims)[] = {{"Ramp", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};