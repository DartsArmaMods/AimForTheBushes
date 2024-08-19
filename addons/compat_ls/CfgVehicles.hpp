class CfgVehicles {
    class lsd_laat_base;
    class lsd_heli_laati_ab: lsd_laat_base {
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
            {20}
        };
        GVARMAIN(rampAnim)[] = {"laat_ramp_open", 0, 1};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};