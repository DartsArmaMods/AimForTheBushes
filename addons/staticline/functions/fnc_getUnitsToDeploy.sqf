#include "..\script_component.hpp"
/*
 * Author: mrschick
 * Generate an array of ALL units to be deployed during the commanded Group Deployment.
 *  - The units are sorted by their group.
 *  - Within each group, units are always sorted side-by-side with others of their assigned color, so that "teams" aren't separated.
 *  - The position of the leader's "team", as well as his position within it, is determined by the CBA Setting GVAR(leaderJumpOrder).
 *
 * Arguments:
 * 0: Groups to deploy <ARRAY>
 * 1: Units embarked <ARRAY>
 *
 * Return Value:
 * Array of units to deploy <ARRAY>
 *
 * Example:
 * [group ace_player, units (vehicle ace_player)] call aftb_staticLine_fnc_getUnitsToDeploy;
 *
 * Public: No
 */

params ["_groupsToDeploy", "_embarkedUnits"];

if (_groupsToDeploy isEqualTo [] || {_embarkedUnits isEqualTo []}) exitWith {[]};

private _unitsToDeploy = [];

// Iterate through all groups to deploy, to ensure units are sorted by their group
{
    private _group = _x;
    private _leader = leader _group;
    private _groupUnits = (units _group) arrayIntersect _embarkedUnits;
    private _unitCount = count _groupUnits;

    /*
     * The following logic uses HashMaps and Array operations to ensure that:
     *  - Units of the same color (assignedTeam) are ALWAYS grouped together;
     *  - The Group Leader's position within the group's deployment sequence is AS CLOSE AS POSSIBLE to where determined by the CBA Setting (first, last, in the middle);
     */
    private _groupUnitsSorted = [];

    // 1. Group Units with the same "Team" (color) together, into HashMap Buckets
    private _allTeams = createHashMap;
    { (_allTeams getOrDefault [(_x getVariable [QGVAR(assignedTeam), assignedTeam _x]), [], true]) pushBack _x } forEach _groupUnits;

    // 2. Separate the Leader's Team Bucket from the others
    private _leaderColor = _leader getVariable [QGVAR(assignedTeam), assignedTeam _leader];
    private _leaderTeam = _allTeams get _leaderColor;
    _allTeams deleteAt _leaderColor;

    private _otherTeams = [];
    { _otherTeams pushBack _y } forEach _allTeams;

    // 3. Reposition the leader's team in the sequence, as well him within his own team, to reflect the preference defined by the CBA Setting
    switch (GVAR(leaderJumpOrder)) do {
        case 0: { // Leader jumps first
            _groupUnitsSorted append ([_leader] + (_leaderTeam - [_leader]));
            _groupUnitsSorted append (flatten _otherTeams);
        };
        case 1: { // Leader jumps in the middle of his group
            // Separate the other teams into 2 buckets, _before and _after, to place them around the leader's team
            private _mid = floor ((count _otherTeams) / 2);
            private _before = flatten (_otherTeams select [0, _mid]);
            private _after = flatten (_otherTeams select [_mid]);

            // Append teams before the leader's
            _groupUnitsSorted append _before;

            // Center the leader as close as possible in his group's sequence, while keeping him with his own team
            private _firstLeaderTeamIdx = count _before;
            private _lastLeaderTeamIdx = _unitCount - count _after - 1;
            private _leaderIdx = ((floor (_unitCount / 2)) max _firstLeaderTeamIdx) min _lastLeaderTeamIdx;

            // Append the leader's team to the group's sequence, with the leader in the desired position/index
            _leaderTeam = _leaderTeam - [_leader];
            for [{private _i = _firstLeaderTeamIdx}, {_i <= _lastLeaderTeamIdx}, {_i = _i + 1}] do {
                if (_i == _leaderIdx) then {
                    _groupUnitsSorted set [_i, _leader];
                } else {
                    _groupUnitsSorted set [_i, _leaderTeam deleteAt 0];
                };
            };

            // Append teams after the leader's
            _groupUnitsSorted append _after;
        };
        case 2: { // Leader jumps last
            _groupUnitsSorted append (flatten _otherTeams);
            _groupUnitsSorted append ((_leaderTeam - [_leader]) + [_leader]);
        };
    };

    #ifdef DEBUG_MODE_FULL
        // Debug output of the current group's jump order, i.e: ["R", "R", "R-L", "B", "B", "B"]
        systemChat str (_groupUnitsSorted apply {
            private _color = (assignedTeam _x) select [0, 1];
            if (_x == leader _x) then {_color + "-L"} else {_color};
        });
    #endif

    // 4. Append the now sorted group to the collective sequence of groups to deploy, filtering out players that aren't hooked in
    _unitsToDeploy append (_groupUnitsSorted select {_x getVariable [QGVAR(isHooked), false] || {!isPlayer _x}});
} forEach _groupsToDeploy;

_unitsToDeploy;
