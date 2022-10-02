---
layout: page
title: MCUs
permalink: /mcus/
---

Bluejay supports EFM8 BB MCUs which are 8Bit, 8051 compatible micro processors.

The differences between the families is listed below:

||BB10 F8|BB21 F16|BB51 F16|
|---|---|---|---|
|Flash|8KB|16KB|16KB|
|RAM|512B|2304B|1280B|
|Standard|256B|256B|256B|
|XRAM|256B|2048B|1024B|
|Clock|25MHz|50MHz|50MHz|
|8-bit GP Timers|0|0|2|
|16-bit GP Timers|4|5|4|
|PCA channels|3|3|3|
|UART|1|2|2|
|Analog Comparators|2|2|2|
|Page Size|512|512|2048|
|Lock Byte||0xFBFF||

## Under the hood
The above differences are kind of the "obvious" things, when it comes to internals there are major differences that are important for our use case:

### Crossbar
The Crossbar is a mechanism to route pins to hardware functionality, you could for example use it to map the UART to specific pins that are easiest for you to reach in your hardware design. Be aware that not all functions can be routed to any pin: Direct pin interrupts INT0 and INT1 can for example only be routed to pins on Port 0.

On BB1 and BB2 MCUs most ports (Port 0, Port 1 and Port 2) are connected to the Crossbar, not so on the BB51 - it only has Port 0 and Port 1 connected to the crossbar.

> A port is a logical grouping of multiple pins.

This is really not much of a limitation though, since even on BB1 and BB2 Port 2 is not being used. This is a packaging limitation - basically all ESCs are using the EFM8 with the QFN20 package which - as the name suggests - only has 20 pins broken out and Port 2 is simply not part of them:

|Pin|Internal|
|---|--------|
| 1 |Port 0.1|
| 2 |Port 0.0|
| 3 |GND|
| 4 |VDD|
| 5 |C2 - CK|
| 6 |C2 - D|
| 7 |Port 1.6|
| 8 |Port 1.5|
| 9 |Port 1.4|
|10 |Port 1.3|
|11 |Port 1.2|
|12 |GND|
|13 |Port 1.1|
|14 |Port 1.0|
|15 |Port 0.7|
|16 |Port 0.6|
|17 |Port 0.5|
|18 |Port 0.4|
|19 |Port 0.3|
|20 |Port 0.2|

This conclueds that we have pins 0-7 of Port 0 available and pins 0-6 of Port 1 - so 15 GPIO pins in general, for us this is plenty since we only really **need 11 pins**:

* 1x for RX input - this pin is used for communication with the flight controller, no matter if it is PWM or as in the case of Bluejay DShot
* 3x for PWM output: 1 PMW output per motor "phase". This does then drive the FETs, either directly or via Triac or some other interface
* 3x for complementary PWM output
* 4x Comparator: 1 comparator per motor "phase" and 1 common comparator input. Those are used for Back EMF measurements

### Comparators
The biggest difference, limitation and reason why BB51 is not a simple drop in replacement for the BB2 are the comparator polarity limitations.

|Comparator|BB2                     |BB51                  |
|----------|------------------------|----------------------|
|Positive  |10 on CMP0 or 12 on CMP1|5 on CMP0 or 4 on CMP1|
|Negative  |10 on CMP0 or 12 on CMP1|3 on CMP0 or 3 on CMP1|

> From now on, we will only look at the QFN20 package, since everything else is not important in our context.

The above table is true only for the QFN28 package, considering th QFN20 package the reality looks like this:

|Comparator|BB2                    |BB51                  |
|----------|-----------------------|----------------------|
|Positive  |10 on CMP0 or 7 on CMP1|5 on CMP0 or 4 on CMP1|
|Negative  |10 on CMP0 or 7 on CMP1|3 on CMP0 or 3 on CMP1|

CMP0 and CMP1 are a bit tricky - since they can span multiple ports (or parts of them).

|CMP |BB2                  |BB51    |
|----|---------------------|--------|
|CMP0|P0 (0-7) and P1 (0-1)|P0 (0-7)|
|CMP1|P1 (0-6)             |P1 (0-6)|

In concrete pin mappings it looks like this:

|Port 0|BB2    |BB51|Port 1|BB2    |BB51|
|------|-------|----|------|-------|----|
|P0.0  |Pos/Neg|Neg |P1.0  |Pos/Neg|Pos |
|P0.1  |Pos/Neg|Pos |P1.1  |Pos/Neg|Neg |
|P0.2  |Pos/Neg|Pos |P1.2  |Pos/Neg|Neg |
|P0.3  |Pos/Neg|Pos |P1.3  |Pos/Neg|Pos |
|P0.4  |Pos/Neg|Neg |P1.4  |Pos/Neg|Pos |
|P0.5  |Pos/Neg|Pos |P1.5  |Pos/Neg|Pos |
|P0.6  |Pos/Neg|Pos |P1.6  |Pos/Neg|Neg |
|P0.7  |Pos/Neg|Neg ||||

You can clearly see, that the BB51 is by far not as flexible with Comparator polarity as the BB2 - this is very important when designing your circuit and also the main reason why **the BB51 is NOT a drop in replacement for the BB2**.

## Datasheets
* [EFM8 BB1 Datasheet](https://www.silabs.com/documents/public/data-sheets/efm8bb1-datasheet.pdf)
* [EFM8 BB2 Datasheet](https://www.silabs.com/documents/public/data-sheets/efm8bb2-datasheet.pdf)
* [EFM8 BB51 Datasheet](https://www.silabs.com/documents/public/data-sheets/efm8bb51-datasheet.pdf)
* [EFM8 BB52 Datasheet](https://www.silabs.com/documents/public/data-sheets/efm8bb52-datasheet.pdf)

## Reference Manuals
* [EFM8 BB1 Reference Manual](https://www.silabs.com/documents/public/reference-manuals/efm8bb1-rm.pdf)
* [EFM8 BB2 Reference Manual](https://www.silabs.com/documents/public/reference-manuals/efm8bb2-rm.pdf)
* [EFM8 BB51 Reference Manual](https://www.silabs.com/documents/public/reference-manuals/efm8bb51-rm.pdf)
* [EFM8 BB52 Reference Manual](https://www.silabs.com/documents/public/reference-manuals/efm8bb52-rm.pdf)
