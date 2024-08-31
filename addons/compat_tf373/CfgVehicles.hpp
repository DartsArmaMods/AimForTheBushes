class CfgVehicles {
    class Helicopter_Base_H;
    class TF373_SOAR_MH47G_Base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"ramp", 0, 1}};
        GVARMAIN(passengerTurrets)[] = {
            {3}, {4}
        };

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);

        EGVAR(helocast,boatPositions)[] = {
            {0, 1.7, -1.3},
            {0, -3.27, -1.3}
        };
        EGVAR(helocast,marker) = "Chemlight_green";
    };
};