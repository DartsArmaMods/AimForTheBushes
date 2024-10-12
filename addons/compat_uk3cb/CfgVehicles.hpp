class CfgVehicles {
    class Heli_Transport_02_base_F;
    class UK3CB_BAF_Merlin_Base: Heli_Transport_02_base_F {
        GVARMAIN(rampAnims)[] = {{"CargoRamp_Open", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);

        EGVAR(helocast,boatPositions)[] = {
            {0.25, 1.7, -0.8}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };
};