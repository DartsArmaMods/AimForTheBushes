class CfgVehicles {
    class Helicopter_Base_H;
    class TF373_SOAR_MH47G_Base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"ramp", 1, 0}};
        GVARMAIN(passengerTurrets)[] = {
            {3}, {4}
        };

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.7, -0.8}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };
};