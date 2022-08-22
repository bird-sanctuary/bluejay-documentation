---
layout: page
title: Deadtime
permalink: /deadtime/
---

deadtime does not have anything to do with the motors and the heat of the motors. Deadtime is the time between the switching from the top/bottom to the bottom/top MOSFET. Because of the turn-off time not being zero and it not being measured, a deadtime between the switching is added to not cause a short circuit through the MOSFETs. It might not be directly noticeable if it is too low as the resistance of the MOSFETs for turn-on/off is higher an the current through both MOSFETs therefore not as high, but it can lead to significantly more losses and heat dissipation, but not at the motors but at the MOSFETs.

To find out the lowest deadtime you have to look at the MOSFETs datasheet of your ESCs. The turn-off time is important here and that at the maximum temperature and current that is expected. As most manufacturers will only tell you the turn-off time at a specified temperature and current, there are a couple of formulas with which it can be approximated (Infineon had some information about that). So how does it effect your setup at the end? Having the deadtime to high will cause the maximum duty cycle as it cannot be 100% anymore (meaning MOSFETs are on all the time). So if you want maximum power -> make the deadtime as low as possible with the risk of short circuiting your MOSFETs/Battery and so on.

To set deadtime take into account Bluejay and Blheli_S's step lenght
```
;**** **** **** **** ****
; Select the FET dead time (or unselect for use with external batch compile file)
;DEADTIME			EQU	15	; 20.4ns per step
```

So for example Bluejay deadtime 10 is equivalent mosfet deadtime is 204ns
