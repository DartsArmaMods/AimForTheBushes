# Introduction

This section covers more technical details intended for those wanting to implement frameworks added by Aim For The Bushes. If you are looking at how to use a feature, instead check out the [Broken link](broken-reference "mention") section.

## Events

Many frameworks utilize [CBA's Custom Events System](https://github.com/CBATeam/CBA\_A3/wiki/Custom-Events-System). These allow third party mods to run code whenever a certain "event" occurs. These events can either be local, meaning the event is only sent to the machine where the event was emitted, or they can be global, meaning that all machines (players, server, etc.) will receive the event.
