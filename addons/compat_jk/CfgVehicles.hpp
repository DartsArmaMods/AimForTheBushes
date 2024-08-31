class CfgVehicles {
    class JK_DC3_Base;
    class JK_C47_Base: JK_DC3_Base {
        GVARMAIN(rampAnims)[] = {{"", 0, 0}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };

    class JK_C47_Cargo_Base: JK_C47_Base {
        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};