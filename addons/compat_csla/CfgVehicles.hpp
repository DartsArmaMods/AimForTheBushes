class CfgVehicles {
    class Helicopter_Base_H;
    class US85_Helicopter_Base_H: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"", 0, 0}};
        EGVAR(helocast,boatPositions)[] = {
            {0, 1.8, 1}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
        EGVAR(helocast,drop) = 1;
    };

    class US85_H60;
    class US85_MH60M134: US85_H60 {
        GVARMAIN(passengerTurrets)[] = {
            {3}, {4},
            {5}, {6}
        };
    };
};