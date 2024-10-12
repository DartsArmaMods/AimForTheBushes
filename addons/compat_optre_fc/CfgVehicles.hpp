class CfgVehicles {
    class Helicopter_Base_F;
    class OPTRE_FC_Spirit_F: Helicopter_Base_F {
        GVARMAIN(rampAnims)[] = {{"cargoDoors", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};