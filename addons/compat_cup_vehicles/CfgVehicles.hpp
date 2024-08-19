class CfgVehicles {
    class Helicopter_Base_H;
    class CUP_Uh60_Base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"", 0, 0}};

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.8, -0.67}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };

    class CUP_Uh60_FFV_Base: CUP_Uh60_Base {
        GVARMAIN(passengerTurrets)[] = {
            {3}, {4},
            {5}, {6}
        };
    };

    class CUP_MH60S_Base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"", 0, 0}};

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.8, -0.75}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
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
        GVARMAIN(rampAnims)[] = {{"ramp", 0, 1}};

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.6, -2.7},
            {0, 6, -2.7}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };

    class Plane_Base_F;
    class CUP_B_MV22_USMC: Plane_Base_F {
        GVARMAIN(rampAnims)[] = {
            {"ramp_bottom", 0, 1},
            {"ramp_top", 0, 1}
        };

        EGVAR(helocast,boatPositions)[] = {
            {0, -1.1, -1.15}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };

    class CUP_C130J_Base: Plane_Base_F {
        GVARMAIN(rampAnims)[] = {
            {"ramp_bottom", 0, 1},
            {"ramp_top", 0, 1}
        };

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};