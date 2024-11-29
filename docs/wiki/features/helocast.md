# Helocast

## 1. Overview

While driving a boat, players are able to load the boat inside of a nearby helicopter. Units will automatically be moved to the helicopter's cargo seats if there is space for them, otherwise they will remain in the boat itself.

These boats can then later be dropped to allow for more stealthy insertions.

{% hint style="info" %}
AI functionality is planned, however AI pilots will continuously fly upwards while a boat is loaded and will never properly fly towards their destination.\


If a work-around is found, AI functionality will be implemented.
{% endhint %}

## 2. Usage

### 2.1 Loading a Boat

To load a boat, the driver must drive the boat close to the helicopter and use the "Recover Boat" scroll wheel action. The helicopter's ramp must be open in order to load the boat inside.

The default loading distance is 7 meters, but this can be changed in the Addon Options menu.

Mission makers can also load boats easily through a custom 3DEN property. These boats will be automatically created and loaded into the airctaft once the mission is started.

![Custom 3DEN Property](https://github.com/DartsArmaMods/AimForTheBushes/blob/main/docs/wiki/images/helocast_3DEN_loadBoats.png)

### 2.2 Unloading a Boat

To unload a boat, the helicopter's ramp must be opened. Then the (co)pilot can interact with the vehicle using `⊞ Win` (ACE3 default) and navigate to the `Helocast` menu. There will be an `Unload Boats` action which will have a unique "unload" action for each currently loaded boat.

After selecting a boat to unload, it will be pushed out of the helicopter and then dropped into the water after moving \~10 meters. This is to prevent collisions with the helicopter while unloading.
