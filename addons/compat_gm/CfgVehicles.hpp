class CfgVehicles {
    class gm_plane_base;
    class gm_do28d2_base: gm_plane_base {
        GVARMAIN(rampAnims)[] = {{"", 0, 0}};
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class gm_do28d2_medevac_base: gm_do28d2_base {
        EGVAR(staticLine,enabled) = 0;
        EGVAR(staticLine,condition) = QUOTE(false);
    };

    class gm_l410_base;
    class gm_l410t_base: gm_l410_base {
        GVARMAIN(rampAnims)[] = {{"", 0, 0}};
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};
