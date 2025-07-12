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
 * [objectParent ace_player, ace_player] call aftb_staticLine_fnc_jump;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("fnc_jump",_vehicle,_unit);

private _hasParachute = _unit call EFUNC(common,hasParachute);
if (!_hasParachute and {backpack _unit != ""} and {"bocr_main" call ace_common_fnc_isModLoaded}) then {
    _unit call bocr_main_fnc_actionOnChest;
    _unit setVariable [QGVAR(movedBackpack), true];
};

private _velocity = velocity _vehicle;
private _direction = direction _vehicle;

[_unit] orderGetIn false;
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
        TRACE_1("Unit has a parachute, open existing one",_unit);
        if (isNull objectParent _unit) then {
            _unit action ["OpenParachute", _unit];
        } else {
            WARNING_2("Unit %1 exited vehicle, but was put into another vehicle (%2)!",_unit,objectParent _unit);
        };

        private _velocity = velocity _unit;
        _parachute = objectParent _unit;
        _parachute setVelocity _velocity;
    } else {
        TRACE_1("Unit does not have a parachute, create one",_unit);
        _parachute = _unit call FUNC(createParachute);
    };

    // Automatically swap backpack back after landing
    if (_unit getVariable [QGVAR(movedBackpack), false]) then {
        _unit addEventHandler ["GetOutMan", {
            params ["_unit"];
            [{
                params ["_unit", "_thisEvent", "_thisEventHandler"];
                if (isTouchingGround _unit or {_unit call ace_common_fnc_isSwimming}) then {
                    _unit call ace_common_fnc_dropBackpack; // Drop reserve
                    // actionOnBack needs a small delay after dropping the reserve
                    [{ [_this] call bocr_main_fnc_actionOnBack }, _unit, 1] call CBA_fnc_waitAndExecute;
                    _unit setVariable [QGVAR(movedBackpack), nil];
                    _unit removeEventHandler [_thisEvent, _thisEventHandler];
                };
            }, [_unit, _thisEvent, _thisEventHandler], 1.5] call CBA_fnc_waitAndExecute
        }];
    };

    [QGVAR(jumped), [_vehicle, _unit, _parachute]] call CBA_fnc_localEvent;
}, [_vehicle, _unit, _hasParachute], _delay] call CBA_fnc_waitAndExecute;
nil;
