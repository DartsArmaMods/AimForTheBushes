# Helocast

## 1. Overview
While driving a boat, players are able to load the boat inside of a nearby helicopter. Units will automatically be moved to the helicopter's cargo seats if there is space for them, otherwise they will remain in the boat itself.

These boats can then later be dropped to allow for more stealthy insertions.

> [!NOTE]
> AI functionality is planned, however AI pilots will attempt to fly upwards away from boats loaded inside of the helicopter, meaning they will not fly low enough to safely eject the boats.
>
> If a work-around is found, AI functionality will be implemented.

## 2. Usage
### 2.1 Loading a Boat
To load a boat, the driver must drive the boat close to the helicopter and use the "Recover Boat" scroll wheel action. The helicopter's ramp must be open in order to load the boat inside.

The default loading distance is 7 meters, but can be changed in the addon settings menu.

### 2.2 Unloading a Boat
To unload a boat, the helicopter's ramp must be opened. Then the (co)pilot can interact with the vehicle using <kbd>⊞&nbsp;Win</kbd> (ACE3 default) and navigate to the `Helocast` menum and then hovering over `Unload Boats`. There will be a unique "unload" action for each currently loaded boat.

After selecting a boat to unload, it will be pushed out of the helicopter and then dropped into the water after moving ~10 meters. This is to prevent collissions with the helicopter while unloading.