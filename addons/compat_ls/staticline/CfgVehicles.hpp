class CfgVehicles {
    class Helicopter_Base_H;
    class lsd_laat_base: Helicopter_Base_H {
        class haf_staticLine {
            enabled = 1;
            condition = QUOTE(true);
            passengerTurrets[] = {
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
                {20}
            };
            doorAnim[] = {"laat_ramp_open", 0, 1};
        };
    };
};