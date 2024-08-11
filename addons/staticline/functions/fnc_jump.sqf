#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit jump from a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [objectParent ace_player, ace_player] call haf_staticLine_fnc_jump;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_jump",_vehicle,_unit);

private _hasParachute = [_unit] call EFUNC(common,hasParachute);
if (!_hasParachute and {["bocr_main"] call ace_common_fnc_isModLoaded}) then {
    [_unit] call bocr_main_fnc_actionOnChest;
};

private _velocity = velocity _vehicle;
private _direction = direction _vehicle;

unassignVehicle _unit;
moveOut _unit;

// isHooked is always reset when exiting a vehicle

_unit setDir (_direction - 180);
_unit setVelocity _velocity;

private _delay = (GVAR(parachuteDelay) + random 1) max 0;

[{
    params ["_vehicle", "_unit", "_hasParachute"];
    private _parachute = objNull;

    if (_hasParachute) then {
        _unit action ["OpenParachute", _unit];
        private _velocity = velocity _unit;
        _parachute = objectParent _unit;
        _parachute setVelocity _velocity;
    } else {
        _parachute = [_vehicle, _unit] call FUNC(createParachute);
    };

    // Automatically swap backpack back after landing
    if (["bocr_main"] call ace_common_fnc_isModLoaded) then {
        _unit addEventHandler ["GetOutMan", {
            params ["_unit"];
            // Check for reserve parachute
            if !([_unit] call EFUNC(common,hasParachute)) then {
                [_unit] call bocr_main_fnc_actionOnBack;
            };
        }];
    };

    [QGVAR(jumped), [_vehicle, _unit, _parachute]] call CBA_fnc_localEvent;
}, [_vehicle, _unit, _hasParachute], _delay] call CBA_fnc_waitAndExecute;
nil;