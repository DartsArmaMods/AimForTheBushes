class CfgVehicles {
    class Helicopter_Base_H;
    class lsd_laat_base: Helicopter_Base_H {
        class haf_staticLine {
            enabled = 1;
            condition = QUOTE(true);
            doorAnim[] = {"laat_ramp_open", 0, 1};
        };
    };
};