class CfgVehicles {
    class Helicopter_Base_H;
    class CUP_UH60_Base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"", 0, 0}};

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.8, -0.67}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
        EGVAR(helocast,drop) = 1;
    };

    class CUP_MH60S_Base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"", 0, 0}};

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.8, -0.75}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
        EGVAR(helocast,drop) = 1;
    };

    class CUP_MH47E_base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"ani_ramp", 0, 1}};

        EGVAR(helocast,boatPositions)[] = {
            {0, -3.5, 2.1},
            {0, 2.2, 2.25}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };

    class CUP_CH53E_Base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"ramp", 0, 0.56}};

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.6, -2.7},
            {0, 6, -2.7}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };

    class Plane_Base_F;
    class CUP_B_MV22_USMC: Plane_Base_F {
        GVARMAIN(rampAnims)[] = {
            {"ramp_bottom", 0, 0.56},
            {"ramp_top", 0, 1}
        };

        EGVAR(helocast,boatPositions)[] = {
            {0, -1.1, -1.15}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };

    class CUP_C130J_Base: Plane_Base_F {
        GVARMAIN(rampAnims)[] = {
            {"ramp_bottom", 0, 0.7},
            {"ramp_top", 0, 1}
        };

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class CUP_C130J_VIV_Base: CUP_C130J_Base {
        EGVAR(staticLine,enabled) = 0;
        EGVAR(staticLine,condition) = QUOTE(false);
    };
};
