#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Handles version mismatches between client and server.
 *
 * Arguments:
 * 0: Server version <ARRAY>
 * 1: Client version <ARRAY>
 * 2: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_serverVersion", "_clientVersion", "_player", "_level"];
TRACE_4("fnc_handleVersionMismatch",_serverVersion,_clientVersion,_player,_level);

private _outdated = false;
{
    if (_x != (_clientVersion # _forEachIndex)) exitWith {
        _outdated = true;
    };
} forEach (_serverVersion select [0, 3]); // Only check major, minor, and patch

if (!_outdated) exitWith {};

private _serverVersionStr = _serverVersion joinString ".";
private _clientVersionStr = _clientVersion joinString ".";
private _title = format ["[%1] ERROR - Version Mismatch", toUpper QUOTE(PREFIX)];
private _message = format ["<t align='center'>Client: %1  Server: %2</t><br/><br/>Running an oudated version on any machine could cause unexpected behavior. Press OK to return to the title screen.", _clientVersionStr, _serverVersionStr];

[{alive (_this#0) && !isNil "CBA_settings_ready"}, {
    params ["", "_title", "_message"];
    if (GVAR(disconnectMismatchedVersions)) then {
        [_title, _message, {true}, {false}] call ace_common_fnc_errorMessage;
    };
}, [_player, _title, _message]] call CBA_fnc_waitUntilAndExecute;

nil;
