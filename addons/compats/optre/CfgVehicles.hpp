class CfgVehicles {
    class OPTRE_ILCS_Rucksack_Black;
    class OPTRE_S12_SOLA_Jetpack: OPTRE_ILCS_Rucksack_Black {
        GVARMAIN(isParachute) = 1;
    };

    class OPTRE_ILCS_Rucksack_Black_Spartan;
    class OPTRE_S12_SOLA_Jetpack_Spartan: OPTRE_ILCS_Rucksack_Black_Spartan {
        GVARMAIN(isParachute) = 1;
    };

    class Helicopter_Base_H;
    class OPTRE_Pelican_F: Helicopter_Base_H {
        GVARMAIN(rampAnims)[] = {{"cargoDoors", 0, 1}};

        EGVAR(staticLine,enabled) = 1;
        EGVAR(staticLine,condition) = QUOTE(true);
    };
};
