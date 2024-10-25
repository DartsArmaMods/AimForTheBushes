# Static Line Jumping

## 1. Overview

Players and AI units are able to hook into a vehicle's static line, which when jumping will automatically deploy a unit's parachute, as well as creating one for them if they are not already wearing one.

## 2. Usage

To use a vehicle's static line, interact with the vehicle using ⊞ Win (ACE3 default) and navigate to the `Static Line` menu. Before being able to jump, players must first hook into the vehicle's static line. Once hooked, a player will be able to jump out the vehicle if the vehicle's ramp is open. Some vehicles may specify other conditions be true as well, but this will vary per vehicle.

After jumping, a parachute will automatically be deployed after a (configurable) delay. If the unit does not have a backpack, or [Backpack on Chest - Redux](https://steamcommunity.com/sharedfiles/filedetails/?id=2372036642) is loaded, the unit will receive a reserve parachute as well; giving them the ability to cut the parachute if needed.

The default settings will use Non-steerable parachutes for units without them, though this can be changed to different classes via the mod's Addon Options.

### Backpack on Chest Compatibility

If [Backpack on Chest - Redux](https://steamcommunity.com/sharedfiles/filedetails/?id=2372036642) is loaded, a unit's (non-parachute) backpack will be automatically placed onto their chest when jumping. The backpack will be placed back onto their back after landing.

## 3. Static Line Jump Waypoint

AI units can static line jump via a special waypoint, AI pilots will attempt to drop all units near the waypoint's position, so make sure to place it correctly.

When the waypoint is activated, the pilot will plot a point \~2000 meters before the waypoint, and fly there. Once this point is reached, passengers will begin to jump from the vehicle while the pilot flies towards the waypoint.
