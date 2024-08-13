#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a boat can be unloaded from a helicopter.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Boat <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, _boat] call haf_helocast_fnc_canUnloadBoat;
 *
 * Public: No
 */

params ["_vehicle", "_boat"];
TRACE_2("fnc_canUnloadBoat",_vehicle,_boat);

private _loadedBoats = _vehicle getVariable [QGVAR(loadedBoats), []];
if (!alive _vehicle or {!alive _boat} or {!(_boat in _loadedBoats)}) exitWith { false; };

true;