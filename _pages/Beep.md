---
layout: page
title: beep_* routines
permalink: /beep/
exclude: true
---

The beep routines are the base for all [beep patterns](#beep-patterns) that are created by the system.

there are normal versions of each beep and short versions of each beep. The higher the number, the higher the tone of the beep.

> Eg.: beep_f4 plays a higher note than beep_f2. beep_f1 and beep_f1_short are the same note, just that the short note only plays for about half as long as the normal one.

[![Beep]({{'/puml/svgs/DetailedDesign-Beep.svg' | relative_url}})]({{'/puml/svgs/DetailedDesign-Beep.svg' | relative_url}})

## Beep patterns
* [Signal lost]({{'/beep/signal-lost/' | relative_url}})
* [Enter bootloader]({{'/beep/enter-bootloader/' | relative_url}})
* [Motor stalled]({{'/beep/motor-stalled/' | relative_url}})
* [Beacon]({{'/beep/beacon/' | relative_url}})
