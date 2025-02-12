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
    class Heli_Attack_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(condition) = QUOTE(true);
    };

    class Heli_Light_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(condition) = QUOTE(true);
    };
    class Heli_light_03_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(condition) = QUOTE(true);
    };

    class Heli_Transport_01_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(condition) = QUOTE(true);
    };
    class Heli_Transport_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(condition) = QUOTE(true);
    };
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(condition) = QUOTE(true);
    };
    class Heli_Transport_04_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(condition) = QUOTE(true);
    };

    class VTOL_01_unarmed_base_F;
    class VTOL_01_infantry_base_F: VTOL_01_unarmed_base_F {
        GVAR(enabled) = 1;
        GVAR(condition) = QUOTE(true);
    };
};