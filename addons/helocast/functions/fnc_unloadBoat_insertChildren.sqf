#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Creates ACE child actions for each loaded boat.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Array of actions <ARRAY>
 *
 * Example:
 * [_target, _player] call haf_helocast_fnc_insertChildren;
 *
 * Public: No
 */

params ["_target", "_player"];
TRACE_2("fnc_unloadBoat_insertChildren",_target,_player);

private _actions = [];

{
    private _config = configOf _x;
    private _name = getText (_config >> "displayName");
    private _icon = [_x] call ace_common_fnc_getVehicleIcon;

    private _action = [
        format [QUOTE(GVAR(unload_%1)), _x],
        format [LLSTRING(action_unloadBoat), _name],
        _icon, {
            params ["_target", "_player", "_params"];
            _params params ["_boat"];
            [_target, _boat] call FUNC(unloadBoat);
        }, {
            params ["_target", "_player", "_params"];
            _params params ["_boat"];
            [_target, _boat] call FUNC(canUnloadBoat);
        }, {}, [_x]
    ] call ace_interact_menu_fnc_createAction;

    _actions pushBack [_action, [], _target];
} forEach (_target getVariable [QGVAR(loadedBoats), []]);

_actions;