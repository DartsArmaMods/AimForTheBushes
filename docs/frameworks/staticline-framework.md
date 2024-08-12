# Static Line Framework

## 1. Usage
To use a vehicle's static line, interact with the vehicle using <kbd>⊞&nbsp;Win</kbd> (ACE3 default) and navigate to the `Static Line` menu. Before being able to jump, players must first hook into the vehicle's static line. Once hooked, a player will be able to jump out the vehicle when:
1. The vehicle's door is open (rear ramp on most vehicles);
2. Any extra condition is also true.

After jumping,

## 2. Configuration
Static line actions are automatically added to all children of `Helicopter` and `Plane`. However, it must be enabled per-vehicle.

```cpp
class CfgVehicles {
    class TAG_myVehicle {
        haf_passengerTurrets[] = {{3}, {4}};
        haf_rampAnim[] = {"Door_rear_source", 0, 1};
        class haf_staticLine {
            enabled = 1;
            condition = "true";
        };
    };
};
```

| Config Name            | Type             | Description                                                       |
| ---------------------- | ---------------- | ----------------------------------------------------------------- |
| `enabled`              | Number           | 0-disabled, 1-enabled                                             |
| `condition`            | String (of code) | Extra condition that must return true in order to jump (OPTIONAL) |
| `haf_passengerTurrets` | Array            | Turret paths for seats that can also static line jump (OPTIONAL)  |
| `haf_rampAnim`         | Array            | Door animation, must be open for players to jump. ["animationSource", closedState, openState]. Closed/open states default to 0/1 respectively. |

## 3. Events
### 3.1 Listenable
| Event Name                             | Passed Parameter(s)                     | Locality | Description                           |
| -------------------------------------- | --------------------------------------- | -------- | ------------------------------------- |
| `haf_staticLine_jumped`                | [_vehicle, _unit, _parachute]           | Local    | A unit jumped out                     |
| `haf_staticLine_jumpWaypointStarted`   | [_vehicle, _startPosition, _wpPosition] | Global   | "Static Line Jump" waypoint started   |
| `haf_staticLine_jumpWaypointFinished`  | [_vehicle, _startPosition, _wpPosition] | Global   | "Static Line Jump" waypoint completed |