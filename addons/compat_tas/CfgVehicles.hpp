class CfgVehicles {
    class Helicopter_Base_H;
    class 3AS_laat_Base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"ramp", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);

        EGVAR(helocast,boatPositions)[] = {
            {0, -1, 4}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };

    class 3AS_LAAT_Cargo_Base: 3AS_laat_Base {
        EGVAR(staticLine,enabled) = 0;
        EGVAR(staticLine,condition) = QUOTE(false);

        EGVAR(helocast,boatPositions)[] = {};
    };
};
