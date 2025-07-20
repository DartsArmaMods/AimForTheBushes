class CfgVehicles {
    class Heli_Transport_01_base_F;
    class vtx_H60_base: Heli_Transport_01_base_F {
        GVARMAIN(rampAnims)[] = {{"", 0, 0}};

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.5, -0.8}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
        EGVAR(helocast,drop) = 1;
    };
};
