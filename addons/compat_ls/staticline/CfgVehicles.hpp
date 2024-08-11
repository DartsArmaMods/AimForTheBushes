class CfgVehicles {
    class ls_laati_base;
    class ls_laati_airborne: ls_laati_base {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};