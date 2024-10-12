class CfgVehicles {
    class Helicopter_Base_H;
    class 3as_laat_Base: Helicopter_Base_H {
        GVARMAIN(passengerTurrets)[] = {
            // Left and right ramp seats, side seats, inside standing seats
            {1}, {2},
            {3}, {4},
            {5}, {6},
            {7}, {8},
            {9}, {10},
            {11}, {12},
            {13}, {15},
            {16}, {17},
            {18}, {19},
            {20}, {21},
            {22}, {23},
            {24}, {25},
            {26}, {27},
            {28}, {29},
            {30}, {31},
            {32}, {33},
            {34}
        };
        GVARMAIN(rampAnims)[] = {{"ramp", 0, 1}};

        EGVAR(helocast,boatPositions)[] = {
            {0, -3, 0.2}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };
    class 3as_LAAT_Mk1: 3as_laat_Base {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
    class 3as_LAAT_Mk1Lights: 3as_laat_Base {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
    class 3as_LAAT_Mk2: 3as_laat_Base {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
    class 3as_LAAT_Mk2Lights: lsd_laat_base {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};
