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

## 4. Commanding Group Jumps

In Arma we lack freedom of movement within a vehicle, which makes it much more difficult than IRL to coordinate a sequential static line deployment with proper spacing. For this reason, AFTB adds a way to automate the process.

Depending on their role, players have different levels of authority on these automated deployments.

- **Pilots and Copilots (NOT gunners)** can command the sequential jump of *any or all* embarked group(s).
- **Jumpmasters** can also deploy *any or all* embarked group(s), including their own, regardless of the seat they are in on the aircraft. Whether a unit/slot has the role of Jumpmaster can be set via an AFTB 3DEN attribute.
- **Group Leaders** can only command the jump of their own group.

{% hint style="info" %}
In any situation, **only** players that hooked into the static line will be automatically deployed. They also must hook in **before** the deployment is initiated, otherwise they will remain on the aircraft.
{% endhint %}

The following picture shows the interactions available to Pilots/Jumpmasters, which also dynamically display how many group members are hooked in, out of those *embarked* (not the absolute total). Group leaders only see the respective interaction for their own group.

![deploy-actions](https://github.com/DartsArmaMods/AimForTheBushes/blob/main/docs/wiki/images/staticline_group-deployment_deploy-actions.jpg?raw=true)

{% hint style="info" %}
The personnel allowed to perform these interactions can be restricted further by the relevant CBA setting `Command Group Jumps`.
{% endhint %}

Pilots and Jumpmasters can abort an in-progress deployment at any time, regardless of who on the aircraft initiated it.

![abort-action](https://github.com/DartsArmaMods/AimForTheBushes/blob/main/docs/wiki/images/staticline_group-deployment_abort-action.jpg?raw=true)

The result is a neatly spaced line of paratroopers, without the danger of mixing groups, leaving gaps or dropping one on top of another (potentially breaking chutes).

![result](https://github.com/DartsArmaMods/AimForTheBushes/blob/main/docs/wiki/images/staticline_group-deployment_result.jpg?raw=true)

Paratroopers are grouped together in their group's jump sequence by their assigned "Team" (White/Red/Blue/Green/Yellow). **This functionality is however unreliable for AI group members.**
