class CfgVehicles {
    class Helicopter_Base_H;
    class uns_UH1C_M21_M200: Helicopter_Base_H {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_UH1D_base: Helicopter_Base_H {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_ch34: Helicopter_Base_H {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_h21c_base: Helicopter_Base_H {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_ch46d: Helicopter_Base_H {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_ch47_m60_usmc: Helicopter_Base_H {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_ch53_base: Helicopter_Base_H {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_Mi8T_base;
    class uns_Mi8T_VPAF: uns_Mi8T_base {
        GVARMAIN(rampAnims)[] = {{"left_clamshell", 0, 1}, {"right_clamshell", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_C130_H_Base;
    class uns_C130_H: uns_C130_H_Base {
        GVARMAIN(rampAnims)[] = {{"door_2_1", 0, 1}, {"door_2_2", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_KC130_H: uns_C130_H_Base {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class uns_plane;
    class uns_an2: uns_plane {
        GVARMAIN(rampAnims)[] = {{"cabindoor", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};