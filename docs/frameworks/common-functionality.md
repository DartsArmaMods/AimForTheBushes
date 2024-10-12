# Common Functionality

Common functionality that is used throughout several components.

## 1. Config Properties
### 1.1 Vehicles
Configures vehicle properties, such as a vehicle's ramp that would be used for paradropping; or turrets that are also considered passengers, such as the blackfish's ffv seats near the ramp.

```cpp
class CfgVehicles {
    class TAG_myVehicle {
        aftb_passengerTurrets[] = {{3}, {4}};
        aftb_rampAnims[] = {
            {"Door_rear_source", 0, 1}
        };
    };
};
```

| Config Name                | Type             | Description                                                |
| -------------------------- | ---------------- | ---------------------------------------------------------- |
| `aftb_passengerTurrets`    | Array            | Extra turret paths to also consider passengers. (OPTIONAL) |
| `aftb_rampAnim`            | Array            | Door animation(s) that one of must be open for players to jump. ["animationSource", closedState, openState]. Closed/open states default to 0/1 respectively. |

> [!NOTE]
> If a vehicle does not have a ramp, you can use `["", 0, 0]` have a vehicle's ramp always be considered open.

### 1.2 Parachutes
Some parachutes classes may not inherit from `B_Parachute`, the vanilla parachute class. To remedy this, AFTB will consider any backpack to be a parachute if it has the `aftb_isParachute` config property set to 1 (or greater). What each component does with a parachute will vary.

If a backpack inherits from `B_Parachute`, then it already has this config property set.

```cpp
class CfgVehicles {
    class TAG_myBackpack {
        aftb_isParachute = 1;
    };
};
```

| Config Name       | Type   | Description                         |
| ----------------- | ------ | ----------------------------------- |
| `aftb_isParachute` | Number | 0-is not a parachute, 1-is a parachute |

## 2. Functions
Functions will always be located in `<addon>/functions` and be named `fnc_functionName.sqf`.

Each function will have the same function header, which lists meta information about the function.

```sqf
#include "..\script_component.hpp"
/*
 * Author(s): Who wrote or modified the function
 * Description of what the function does.
 *
 * Arguments:
 * 0: Argument name <TYPE>
 * 1: Argument name (optional, default: value) <TYPE>
 *
 * Return Value:
 * Description <TYPE>
 *
 * Example:
 * [arg1] call aftb_component_fnc_functionName;
 *
 * Public: Yes/No
 */
```

The last line says whether a given function is within the public API or not. Functions that are within the API will be kept backwards compatible and their general functionality will not change.

Functions that are not within the public API may have new required parameters added, or have their functionality changed without warning.