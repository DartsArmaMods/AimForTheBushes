class CfgVehicles {
    class Helicopter_Base_F;
    class OPTRE_FC_Spirit_F: Helicopter_Base_F {
        GVARMAIN(passengerTurrets)[] = {
            {1},  {2},  {3},  {4},
            {5},  {6},  {7},  {8},
            {9},  {10}, {11}, {12},
            {13}, {14}, {15}, {16}
        };
        GVARMAIN(rampAnims)[] = {
            {"cargoDoors", 0, 1}
        };

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};