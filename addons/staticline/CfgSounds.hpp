class CfgSounds {
    class GVAR(hook) {
        sound[] = {"\a3\sounds_f\vehicles\air\noises\SL_1hooklock.wss", 5, 1, 30};
        titles[] = {};
    };
    class GVAR(unhook): GVAR(hook) {
        sound[] = {"\a3\sounds_f\vehicles\air\noises\SL_1hookunlock.wss", 5, 1, 30};
    };
};