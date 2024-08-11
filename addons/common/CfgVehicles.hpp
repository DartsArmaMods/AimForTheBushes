class CfgVehicles {
    class Bag_Base;
    class B_Parachute: Bag_Base {
        GVAR(isParachute) = 1; // Not required, since condition also checks `isKindOf B_Parachute`, but here for demonstration
    };
};