class CfgVehicles {
    class Air;
    class Plane: Air {
        class ACE_SelfActions {
            MAIN_ACTION;
        };
    };

    class Helicopter: Air {
        class ACE_SelfActions {
            MAIN_ACTION;
        };
    };

    class Helicopter_Base_H;
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        class ADDON {
            enabled = 1;
            condition = QUOTE(true);
        };
    };

    class VTOL_01_unarmed_base_F;
    class VTOL_01_infantry_base_F: VTOL_01_unarmed_base_F {
        class ADDON {
            enabled = 1;
            condition = QUOTE(true);
        };
    };
};