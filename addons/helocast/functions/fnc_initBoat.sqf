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
 * _boat call aftb_helocast_fnc_initBoat;
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("fnc_initBoat",_vehicle);

if (!alive _vehicle || !simulationEnabled _vehicle) exitWith {};

// Mods have a tendency to overwrite / clear the UserActions class, so we add it manually
if (hasInterface) then {
    _vehicle addAction [LLSTRING(action_recoverBoat), {
        params ["_target"];
        private _vehicle = _target getVariable [QGVAR(loadTarget), objNull];
        [_vehicle, _target] call FUNC(loadBoat);
    }, [], 5, true, true, "", QUOTE(ace_player == currentPilot _originalTarget and {[ARR_3(_originalTarget,nil,true)] call FUNC(canLoadBoat)}), GVAR(loadDistance)];

    private _typeOf = typeOf _vehicle;
    if (_typeOf in GVAR(initializedBoats)) exitWith {};
    GVAR(initializedBoats) pushBack _typeOf;

    private _action = [QGVAR(removeMarker), LLSTRING(action_removeMarker), "", {
        params ["_target"];
        deleteVehicle (_target getVariable [QGVAR(marker), objNull]);
        _target setVariable [QGVAR(marker), nil, true];
    }, {
        params ["_target", "_player"];
        _player == currentPilot _target && !isNull (_target getVariable [QGVAR(marker), objNull]);
    }] call ace_interact_menu_fnc_createAction;

    [_typeOf, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;
};
