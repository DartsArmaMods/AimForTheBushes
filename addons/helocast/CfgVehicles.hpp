class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            MAIN_ACTION;
        };
    };

    // Assault / Rescue inflatable boats
    class Boat_F;
    class Rubber_duck_base_F: Boat_F {
        GVAR(isLoadable) = 1;
        GVAR(markerOffset)[] = {0, 2.25, -0.52};
    };

    class Helicopter_Base_H;
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        GVAR(boatPositions)[] = {
            {0, -2.1, -0.6}
        };
        GVAR(marker) = "Chemlight_green";
    };

    class VTOL_01_unarmed_base_F;
    class VTOL_01_infantry_base_F: VTOL_01_unarmed_base_F {
        GVAR(boatPositions)[] = {
            {0, -1.27, -4.4}
        };
        GVAR(marker) = "Chemlight_green";
    };
};
