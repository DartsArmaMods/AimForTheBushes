class CfgVehicles {
    class Bag_Base;
    class B_Parachute: Bag_Base {
        GVARMAIN(isParachute) = 1;
    };

    class Helicopter_Base_H;
    class Heli_Transport_02_base_F: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"cargoramp_open", 0, 1}};
    };
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"Door_rear_source", 0, 1}}; // animationSource, closedState, openState
    };

    class Heli_Transport_04_base_F;
    class O_Heli_Transport_04_covered_F: Heli_Transport_04_base_F {
        GVARMAIN(rampAnims)[] = {{"Door_6_source", 0, 1}};
    };

    class VTOL_01_unarmed_base_F;
    class VTOL_01_infantry_base_F: VTOL_01_unarmed_base_F {
        GVARMAIN(rampAnims)[] = {{"Door_1_source", 0, 1}};
    };
};