# Helocast Framework

>[!IMPORTANT]
> While a boat is loaded inside of a vehicle, it will have it's **mass set to 0** (to prevent collisions), **locked**, **engine locked**, and **damage disabled**. These are all done to prevent issues such as units dismounting, the boat colliding with the helicopter and causing damage, etc.

If you need to access the mass of a loaded boat, it is saved to the `aftb_common_originalMass` variable on the boat itself.

## 1. Config Values
### 1.1 Helicopters
Helocast actions are automatically added to all children of `Helicopter`; however, it must be enabled per vehicle.

```cpp
class CfgVehicles {
    class TAG_myVehicle {
        aftb_helocast_boatPositions[] = {
            {0, 0, 0}
        };
        aftb_helocast_marker = "Chemlight_green";
        aftb_helocast_drop = 0;
    };
};
```

| Config Name                  | Type   | Description                                                      |
| ---------------------------- | ------ | ---------------------------------------------------------------- |
| `aftb_helocast_boatPositions` | Array  | Array of model offsets where boats will be stored                |
| `aftb_helocast_marker`        | String | `CfgVehicles` class to spawn on deployed boats                   |
| `aftb_helocast_drop`          | Number | 0-slide boat away from vehicle, 1-drop boat downwards (OPTIONAL) |

### 1.2 Boats
Only inflatable (children of `Rubber_duck_base_F`) boats are loadable by default, but any object can be made loadable.

```cpp
class CfgVehicles {
    class TAG_myBoat {
        aftb_helocast_isLoadable = 1;
        aftb_helocast_markerOffset[] = {0, 0, 0};
    };
};
```

| Config Name                 | Type   | Description                                 |
| --------------------------- | ------ | ------------------------------------------- |
| `aftb_helocast_isLoadable`   | Number | 0-not loadable by helicopters, 1-loadable   |
| `aftb_helocast_markerOffset` | Array  | Model offsets where marker will be attached |

## 2. Events
### 2.1 Listenable
| Event Name                  | Passed Parameter(s)       | Locality | Description         |
| --------------------------- | ------------------------- | -------- | ------------------- |
| `aftb_helocast_boatLoaded`   | [_vehicle, _boat, _index] | Global   | A boat was loaded   |
| `aftb_helocast_boatUnloaded` | [_vehicle, _boat, _index] | Global   | A boat was unloaded |