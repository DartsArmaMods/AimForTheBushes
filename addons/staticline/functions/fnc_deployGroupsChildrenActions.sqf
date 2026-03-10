#include "..\script_component.hpp"
/*
 * Author: mrschick
 * Dynamically fills the deployGroups action with subactions, allowing high-ranking crew/passengers to command the staggered line jump of embarked groups (hooked players or AI), or group leaders to command the jump of their own group.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Array of ACE Child Actions <ARRAY>
 *
 * Example:
 * [objectParent ace_player, ace_player] call aftb_staticLine_fnc_deployGroupsChildrenActions;
 *
 * Public: No
 */

params ["_vehicle", "_unit"];

// Generate array of embarked groups
private _embarkedUnits = _vehicle call EFUNC(common,getPassengers);
private _embarkedGroups = [];
{
    _embarkedGroups pushBackUnique (group _x);
} forEach _embarkedUnits;

// Abort early if there are no groups to deploy
if (_embarkedGroups isEqualTo []) exitWith {[]};

// Evaluate specific permissions player should have, to determine which interactions are available to them
private _unitIsJumpMaster = (_unit getVariable [QGVAR(isJumpMaster), false]) || {GVAR(commandGroupJumps) > 1 && {[_vehicle, _unit] call FUNC(isAircraftCrew)}};

private _actions = [];
private _action = [];

if ((_vehicle getVariable [QGVAR(unitsToDeploy), []]) isNotEqualTo []) then {
    // If a deployment is in progress, only give jumpmasters the action to abort any in-progress deployment
    if (_unitIsJumpMaster) then {
        private _unitsRemaining = count (_vehicle getVariable [QGVAR(unitsToDeploy), []]);
        _action = ([
            QGVAR(abortGroupDeployment),
            format [LLSTRING(action_abortGroupDeployment), _unitsRemaining],
            "",
            {(_this select 0) setVariable [QGVAR(unitsToDeploy), [], true]},
            {true}
        ] call ace_interact_menu_fnc_createAction);
        _actions pushBack [_action, [], _vehicle];
    };
} else {
    // Pilot/Jumpmaster can deploy all groups in sequence
    if (_unitIsJumpMaster && {count _embarkedGroups > 1}) then {
        _action = [
            QGVAR(deployAllGroups),
            LLSTRING(action_deployAllGroups),
            "",
            {
                params ["_vehicle", "_unit", "_args"];
                [_vehicle, false, _args call FUNC(getUnitsToDeploy)] call FUNC(jumpAI);
            },
            {true},
            {},
            [_embarkedGroups, _embarkedUnits]
        ] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action, [], _vehicle];
    };

    // Generate one action per-group, to deploy each automatically
    {
        private _group = _x;
        // Jumpmasters can deploy any group, group leaders can only deploy their own
        if (_unitIsJumpMaster || {GVAR(commandGroupJumps) == 3 && {_unit == leader _group}}) then {
            private _groupUnits = (units _group) arrayIntersect _embarkedUnits;
            private _hookedUnits = _groupUnits select {_x getVariable [QGVAR(isHooked), false] || {!isPlayer _x}};
            private _groupName = groupId _group;
            _action = [
                QGVAR(deploy_) + _groupName,
                format ["%1 (%2)", _groupName, format [LLSTRING(action_hooked), count _hookedUnits, count _groupUnits]],
                "",
                {
                    params ["_vehicle", "_unit", "_args"];
                    [_vehicle, false, _args call FUNC(getUnitsToDeploy)] call FUNC(jumpAI);
                },
                {true},
                {},
                [[_group], _embarkedUnits]
            ] call ace_interact_menu_fnc_createAction;
            _actions pushBack [_action, [], _vehicle];
        };
    } forEach _embarkedGroups;
};

_actions;
