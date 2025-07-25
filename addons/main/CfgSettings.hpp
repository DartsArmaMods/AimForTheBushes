class CfgSettings {
    class CBA {
        class Versioning {
            class PREFIX {
                main_addon = QUOTE(ADDON);
                handler = QFUNC(handleVersionMismatch);

                class dependencies {
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, QUOTE(true)};
                    ACE[] = {"ace_main", REQUIRED_ACE_VERSION, QUOTE(true)};
                };
            };
        };
    };
};
