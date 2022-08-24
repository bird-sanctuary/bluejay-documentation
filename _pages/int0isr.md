---
layout: page
title: Interrupt 0 ISR
permalink: /interrupt-0-isr/
exclude: true
---

Triggered by **falling edges**, detects DShot RX edges and stores time between falling edges in XRAM.

[![Int0isr]({{'/puml/svgs/DetailedDesign-Int0isr.svg' | relative_url}})]({{'/puml/svgs/DetailedDesign-Int0isr.svg' | relative_url}})

## Decode_Dshot_2bit Macro
[![DecodeDshot2bit]({{'/puml/svgs/DetailedDesign-DecodeDshot2bit.svg' | relative_url}})]({{'/puml/svgs/DetailedDesign-DecodeDshot2bit.svg' | relative_url}})
