class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            MAIN_ACTION;
        };
    };

    class Helicopter_Base_H;
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        GVAR(boatPositions)[] = {
            {0, -2.1, -0.6}
        };
        GVAR(marker) = "Chemlight_green";
    };
};