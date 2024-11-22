# Helocast

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

| Config Name                   | Type   | Description                                                      |
| ----------------------------- | ------ | ---------------------------------------------------------------- |
| `aftb_helocast_boatPositions` | Array  | Array of model offsets where boats will be stored                |
| `aftb_helocast_marker`        | String | Class name or model path                                         |
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

| Config Name                  | Type   | Description                                 |
| ---------------------------- | ------ | ------------------------------------------- |
| `aftb_helocast_isLoadable`   | Number | 0-not loadable, 1-loadable                  |
| `aftb_helocast_markerOffset` | Array  | Model offsets where marker will be attached |

## 2. Events

### 2.1 Listenable

| Event Name                   | Passed Parameter(s)           | Locality | Description         |
| ---------------------------- | ----------------------------- | -------- | ------------------- |
| `aftb_helocast_boatLoaded`   | \[\_vehicle, \_boat, \_index] | Global   | A boat was loaded   |
| `aftb_helocast_boatUnloaded` | \[\_vehicle, \_boat, \_index] | Global   | A boat was unloaded |

## 3. Scripting Examples
### 3.1 Loading Boats in Eden
```sqf
[aircraftName, boat, nil, nil, true] call aftb_helocast_fnc_loadBoat;
```

## 4. Public Functions
### 4.1 Load Boat
```sqf
/*
 * Author: DartRuffian
 * Loads a boat into a given vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Boat <OBJECT>
 * 2: Move boat crew into vehicle (optional, default: true) <BOOL>
 * 3: Index (optional, default: first found) <NUMBER>
 * 4: Ignore ramp (optional, default: false) <BOOL>
 *    - If true, the ramp's animation state will be ignored
 *
 * Return Value:
 * True if boat was loaded, otherwise false <BOOL>
 *
 * Example:
 * [_vehicle, _boat] call aftb_helocast_fnc_loadBoat;
 *
 * Public: Yes
 */
```

### 4.2 Unload Boat
```sqf
/*
 * Author: DartRuffian
 * Loads a boat into a given vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Boat <OBJECT>
 *
 * Return Value:
 * True if boat was unloaded, otherwise false <BOOL>
 *
 * Example:
 * [_vehicle, _boat] call aftb_helocast_fnc_unloadBoat;
 *
 * Public: Yes
 */
```