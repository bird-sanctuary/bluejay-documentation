---
layout: page
title: Interrupt 0 ISR
permalink: /interrupt-0-isr/
exclude: true
---

> Show related code for [int0_int]({{'int0_int' | search_code_url}}){:target="_blank"}.

Triggered by **falling edges**, detects DShot RX edges and stores time between falling edges in XRAM.

[![int0_int]({{'/puml/svgs/DetailedDesign-Int0isr.svg' | relative_url}})]({{'/puml/svgs/DetailedDesign-Int0isr.svg' | relative_url}})
