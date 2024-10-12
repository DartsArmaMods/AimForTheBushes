class CfgVehicles {
    class Helicopter_Base_H;
    class lsd_laat_base: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"laat_ramp_open", 0, 1}};

        EGVAR(helocast,boatPositions)[] = {{0, -3, 0.2}};
        EGVAR(helocast,marker) = "Chemlight_green";
    };
    class lsd_heli_laati_ab: lsd_laat_base {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};