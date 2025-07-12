#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Global version of say3D.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: CfgSounds class <STRING>
 * 2: Distance in meters (optional, default: -1) <NUMBER>
 *    - If -1, will check CfgSounds entry for distance value
 *    - If undefined in config, then say3D default of 100 will be used
 * 3: isSpeech (optional, default: 0) <NUMBER / BOOL>
 *    - 0/false = play as sound (fadeSound applies)
 *    - 1/true = play as speech (fadeSpeech applies), filters are not applied to it (i.e. house or vehicle interior one)
 *    - 2 = play as sound (fadeSound applies) without interior/vehicle muffling
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, "sound"] call aftb_common_fnc_say3D
 *
 * Public: Yes
 */

params [
    ["_object", objNull, [objNull]],
    ["_sound", "", [""]],
    ["_distance", -1, [0]],
    ["_isSpeech", 0, [0, true]]
];
TRACE_4("fnc_say3D",_object,_sound,_distance,_isSpeech);

if (_distance == -1) then {
    getArray (configFile >> "CfgSounds" >> _sound >> "sound") params ["", "", "", ["_dst", 100]];
    _distance = _dst; // doing params [..., "_distance"] wouldn't update the outer scope
};

[QGVAR(say3D), [_object, _sound, _distance, _isSpeech]] call CBA_fnc_globalEvent;
nil;
