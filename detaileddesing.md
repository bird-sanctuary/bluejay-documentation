---
layout: page
title: Detailed Design
permalink: /detailed-design/
---

Two different kinds of interrupts exist - **timer based** and **hardware based**. Bluejay is taking advantage of both types for different tasks. Interrupt Service Routines are the functions invoked when an interrupt is triggered and take over code execution immediately - no matter what the main code execution is doing, it is stopped, the interrupt service routine takes over, does its job and regular code execution takes over again.

> Best practice is to keep interrupt service routines as short as possible as not to run into race conditions where one routine is interrupted by another routine.

Interrupts can also be disabled, which makes sense if you for example know that you have to finish a certain block of code without any further interruption. Oftentimes interrupts are disabled in interrupt service routines as to not run into any race conditions.

## Timer Interrupt Service Routines
Timer based interrupts, trigger - as the name suggests - at given times. Timer based interrupts consist of a counter, once it overflows back to zero, the matching ISR is triggered.

The calculation of the time is not as easy as just saying: "Trigger every 30ms". The calculation is more involved:

The MCU is clocked at a certain frequency - lets say in the case of a BB21 at maximum 50MHz, or in other words: 50000000 clock cycles per second.

The clock frequency is divided by 12 (on 8051 based timers) and the timers counter is thus incremented every **1 / (50MHz / 12) seconds = 240ns**. Or in other words: The tick duration is 240ns.

> EFM8 provides different sources for the clock frequency and depending on source also different divisors. When using the system clock, divisors for the timer can be: 12, 4 and 48 (on timer 0 and 1) or 12 on timers 2, 3 and 4. <br/>
If using an external clock, the divisor can only be 8.

8051 based timers are (up to) 16Bit wide (having a low and a high Byte) and are thus capable of counting to 65535 before overflowing back to 0.

If you want to invoke a routine every 10ms the calculation would look like so:

> count = delay / tick<br/>
> count = 10ms / 240ns = 41666.7

since we can only count to integers we need to take the next closes value, so the count needs to be **41667**, actually resulting in an interval of **10.00008ms**.

> count = 41667<br/>
> regValue = maxValue - count<br/>
> regValue = 65535 - 41667 = 23868

which means that the register values would need to be set like so:
> regValue = 0x5D3C
> regValueHi = 0x5D <br/>
> regValueLo = 0X3C

* [Timer 0 ISR]({{ '/timer-0-isr/' | relative_url }})
* [Timer 1 ISR]({{ '/timer-1-isr/' | relative_url }})
* [Timer 2 ISR]({{ '/timer-2-isr/' | relative_url }})
* [Timer 3 ISR]({{ '/timer-3-isr/' | relative_url }})

## Hardware Interrupt Service Routines
Hardware interrupts are a bit more intuitive: An external input triggers the according ISR. BB based MCUs have 2 hardware interrupts with dedicated interrupt vectors, but technically GPIO pins can also be used as interrupts, although with a shared interrupt vector.

Hardware interrupts are triggered on state change, so either falling edge, rising edge or either.

* [INT0 ISR]({{ '/interrupt-0-isr/' | relative_url }})
* [INT1 ISR]({{ '/interrupt-1-isr/' | relative_url }})

## Misc
* [SchedulerRun()]({{ '/scheduler-run/' | relative_url }})
