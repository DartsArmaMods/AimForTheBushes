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
 * Example:
 * [] call aftb_main_fnc_handleVersionMismatch;
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
private _title = "Version Mismatch";
private _message = format ["<t align='center'>Client: %1  Server: %2</t><br/><br/>Running an oudated version on any machine could cause unexpected behavior. Press OK to return to title screen, or CANCEL to continue playing.", _clientVersionStr, _serverVersionStr];

[{alive (_this#0)}, {
    params ["", "_title", "_message"];
    [
        format ["[%1] ERROR - %2", toUpper QUOTE(PREFIX), _title], _message, {
            findDisplay 46 closeDisplay 0;
        }, {
            WARNING("Client accepted version mismatch warning. Here be dragons.");
        }
    ] call ace_common_fnc_errorMessage;
}, [_player, _title, _message]] call CBA_fnc_waitUntilAndExecute;

nil;