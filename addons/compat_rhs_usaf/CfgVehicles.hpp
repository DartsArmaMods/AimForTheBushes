class CfgVehicles {
    class Helicopter_Base_H;
    class rhsusf_CH53E_USMC: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"ramp", 0, 0.56}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);

        EGVAR(helocast,boatPositions)[] = {
            {0, 5.75, -2.59},
            {0, 0.8, -2.59}
        };
        EGVAR(helocast,minUnloadDistance) = 12;
    };

    class Heli_light_03_base_F;
    class RHS_UH1_Base: Heli_light_03_base_F {
        GVARMAIN(rampAnims)[] = {{"doorhandler_l", 0, 1}, {"doorhandler_r", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class RHS_UH60_Base;
    class RHS_UH60M_base: RHS_UH60_Base {
        GVARMAIN(rampAnims)[] = {{"doorhandler_l", 0, 1}, {"doorhandler_r", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.8, -1.45}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
        EGVAR(helocast,drop) = 1;
    };

    class Heli_Transport_02_base_F;
    class RHS_CH_47F_base: Heli_Transport_02_base_F {
        GVARMAIN(rampAnims)[] = {{"ramp_anim", 0, 0.6}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.7, -1.3},
            {0, -3.27, -1.3}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
        EGVAR(helocast,minUnloadDistance) = 12;
    };

    class RHS_CH_47F_cargo_base: RHS_CH_47F_base {
        EGVAR(staticLine,enabled) = 0;
        EGVAR(staticLine,condition) = QUOTE(false);
    };

    class Plane_Base_F;
    class RHS_C130J_Base: Plane_Base_F {
        GVARMAIN(rampAnims)[] = {{"ramp", 0, 0.65}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class RHS_C130J_Cargo_Base: RHS_C130J_Base {
        EGVAR(staticLine,enabled) = 0;
        EGVAR(staticLine,condition) = QUOTE(false);
    };
};