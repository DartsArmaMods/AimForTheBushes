#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit can hook into a static line.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Parachute class (optional, parachute setting) <STRING>
 *
 * Return Value:
 * Parachute <OBJECT>
 *
 * Example:
 * [ace_player] call haf_staticLine_fnc_createParachute;
 *
 * Public: No
 */

params ["_unit", ["_parachuteClass", GVAR(defaultParachute)]];
TRACE_2("fnc_createParachute",_unit,_parachuteClass);

private _positionAGL = ASLToAGL (getPosASL _unit);
private _parachute = createVehicle [_parachuteClass, _positionAGL, [], 0, "CAN_COLLIDE"];

private _direction = direction _unit;
private _velocity = velocity _unit;

_parachute setDir (_direction - 180);
_parachute setVelocity _velocity;

_unit assignAsDriver _parachute;
_unit moveInDriver _parachute;

if (backpack _unit == "") then {
    _unit addBackpackGlobal GVAR(defaultReserveParachute);
    _parachute setVariable ["ace_parachute_canCut", true];
    // A reserve parachute itself obviously doesn't have another reserve, manually set the "canCut" variable
};

_parachute;