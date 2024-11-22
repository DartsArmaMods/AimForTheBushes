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

private _minDistance = getNumber (configOf _vehicle >> QGVAR(minUnloadDistance));
if (_minDistance <= 0) then {
    _minDistance = 5;
};

// TODO: Account for drop = 1 in config
private _fromPosASL = getPosASL _boat;
private _direction = direction _vehicle;
private _toPosASL = _fromPosASL vectorDiff [
    _minDistance * sin _direction,
    _minDistance * cos _direction,
    0
];

// These should remain unchanged while unloading
private _fromVelocity = velocity _vehicle;
private _toVelocity = _fromVelocity vectorDiff [
    2 * sin _direction,
    2 * cos _direction,
    2
];
private _vectorDir = vectorDir _boat;
private _vectorUp = vectorUp _boat;

detach _boat;

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_boat", "_fromPosASL", "_toPosASL", "_fromVelocity", "_toVelocity", "_vectorDir", "_vectorUp", "_interval"];
    TRACE_9("",_vehicle,_boat,_fromPosASL,_toPosASL,_fromVelocity,_toVelocity,_vectorDir,_vectorUp,_interval);

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

    _args set [-1, _interval + 0.05];
}, 0.01, [_vehicle, _boat, _fromPosASL, _toPosASL, _fromVelocity, _toVelocity, _vectorDir, _vectorUp, 0]] call CBA_fnc_addPerFrameHandler;
nil;