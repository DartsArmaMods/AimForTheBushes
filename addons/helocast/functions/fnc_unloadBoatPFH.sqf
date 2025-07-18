#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Description
 *
 * Arguments:
 * 0:
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, _boat] call aftb_helocast_fnc_unloadBoatPFH;
 *
 * Public: No
 */

params ["_vehicle", "_boat"];
TRACE_2("fnc_unloadBoatPFH",_vehicle,_boat);

if (!local _boat) exitWith {
    TRACE_1("unloadBoatPFH called with remote object",_boat);
    [QGVAR(unloadBoatPFH), _this, _boat] call CBA_fnc_targetEvent;
};

private _config = configOf _vehicle;
private _minDistance = getNumber (_config >> QGVAR(minUnloadDistance));
if (_minDistance <= 0) then {
    _minDistance = 6;
};

private _drop = getNumber (_config >> QGVAR(drop));

private _fromPosASL = getPosASL _boat;
private _direction = direction _vehicle;
private _fromVelocity = velocity _vehicle;
private _vectorDir = vectorDir _boat;
private _vectorUp = vectorUp _boat;

private ["_toPosASL", "_toVelocity"];

if (_drop >= 1) then {
    _toPosASL = _fromPosASL vectorDiff [0, 0, _minDistance];
    _toVelocity = _fromVelocity; // No change needed
} else {
    _toPosASL = _fromPosASL vectorDiff [
        _minDistance * sin _direction,
        _minDistance * cos _direction,
        0
    ];

    _toVelocity = _fromVelocity vectorDiff [
        2 * sin _direction,
        2 * cos _direction,
        0
    ];
};

private _startTime = diag_tickTime;

detach _boat;
TRACE_8("unloadPFH params",_vehicle,_boat,_fromPosASL,_toPosASL,_fromVelocity,_toVelocity,_vectorDir,_vectorUp);

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_boat", "_fromPosASL", "_toPosASL", "_fromVelocity", "_toVelocity", "_vectorDir", "_vectorUp", "_startTime"];

    private _interval = (diag_tickTime - _startTime) / 2;
    TRACE_1("unloadPFH loop",_interval);

    if (_interval > 1) then {
        _handle call CBA_fnc_removePerFrameHandler;
        [QGVAR(boatUnloaded), [_vehicle, _boat, _index]] call CBA_fnc_globalEvent;
        _vehicle setVariable [QGVAR(isUnloading), nil, true];
        [QEGVAR(common,blockDamage), [_vehicle, QGVAR(isUnloadingBoat), false]] call CBA_fnc_globalEvent;
    };

    _boat setVelocityTransformation [
        _fromPosASL, _toPosASL,
        _fromVelocity, _toVelocity,
        _vectorDir, _vectorDir,
        _vectorUp, [0, 0, 1],
        _interval
    ];
}, 0.01, [_vehicle, _boat, _fromPosASL, _toPosASL, _fromVelocity, _toVelocity, _vectorDir, _vectorUp, _startTime]] call CBA_fnc_addPerFrameHandler;
nil;
