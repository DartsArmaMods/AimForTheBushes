#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Initializes helocast systems on a boat.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_boat] call haf_helocast_fnc_initBoat;
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("fnc_initBoat",_vehicle);

if (!alive _vehicle or {!simulationEnabled _vehicle}) exitWith {};

if (hasInterface) then {
    _vehicle addAction [LLSTRING(action_loadBoat), {
        params ["_target", "_caller", "_actionId", "_arguments"];
        private _vehicle = _target getVariable [QGVAR(loadTarget), objNull];
        [_vehicle, _target] call FUNC(loadBoat);
    }, [], 5, true, true, "", QUOTE(ace_player == currentPilot _originalTarget and {[_originalTarget] call FUNC(canLoadBoat)}), BOAT_LOAD_DISTANCE];

    private _action = [QGVAR(removeMarker), "Remove Marker", "", {
        params ["_target"];
        private _marker = _target getVariable [QGVAR(marker), objNull];
        deleteVehicle _marker;
        _target setVariable [QGVAR(marker), nil, true];
    }, {
        params ["_target", "_player"];
        _player == currentPilot _target and {!isNull (_target getVariable [QGVAR(marker), objNull])};
    }] call ace_interact_menu_fnc_createAction;

    [typeOf _vehicle, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;
};