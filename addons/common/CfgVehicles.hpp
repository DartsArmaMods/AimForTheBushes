class CfgVehicles {
    class Bag_Base;
    class B_Parachute: Bag_Base {
        GVARMAIN(isParachute) = 1; // Not required, since condition also checks `isKindOf B_Parachute`, but here for demonstration
    };

    class Helicopter_Base_H;
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        GVARMAIN(passengerTurrets)[] = {{3}, {4}}; // Left and right ramp seats
        GVARMAIN(rampAnim)[] = {"Door_rear_source", 0, 1}; // animationSource, closedState, openState
    };

    class VTOL_01_unarmed_base_F;
    class VTOL_01_infantry_base_F: VTOL_01_unarmed_base_F {
        GVARMAIN(passengerTurrets)[] = {{3}, {4}}; // Left and right ramp seats
        GVARMAIN(rampAnim)[] = {"Door_1_source", 0, 1};
    };
};