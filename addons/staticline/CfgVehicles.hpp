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
            condition = QUOTE(_this#0 animationSourcePhase 'Door_rear_source' == 1);
        };
    };

    class VTOL_Base_F;
    class VTOL_01_base_F: VTOL_Base_F {
        class ADDON {
            enabled = 1;
            condition = QUOTE(_this#0 animationSourcePhase 'Door_1_source' == 1);
        };
    };
};