class CfgSounds {
    class GVAR(loadBoat) {
        sound[] = {"\a3\sounds_f\vehicles\boat\noises\light_metal_boat_crash_armor_02.wss", 3, 1, 50};
        titles[] = {};
    };
    class GVAR(unloadBoat): GVAR(loadBoat) {
        // TODO: Different sound?
    };
};