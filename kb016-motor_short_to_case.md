# Motor short to the case -> User reporting commutation is not done right and communication problems with channel 4 in 4in1 board

User
 — 
14/08/2022
Hi , i have flashed verion 0.16 48KHz to Happymodel Aio5in1 915MHz.  Sometimes the motors the commutation is not right  and the current is much higher then expected then in  flight they are in sync and the current is the normal expected value. Betaflight 4.3.1 DSHot 300 . tried bidir Dshot300  same behaviour. I have tried different Timings and Demag Values . With bidir Dshot ESC4 has somteimes Errors. Is this a known Bug or maybe bad esc?

Bluejay
 — 
14/08/2022
I have been thinking on your issue and I think that we will need to debug that board to know what the problem is.

We also have a new version with wich you can get debuging values from the esc so you can debug on your side, if you like.
You will need to change and compile on your side to get debugging values.

User
 — 
14/08/2022
Hi
i have made some more Tests.
with 24 KHz Version its same.
to be sure that is no BF Issue .i will reset this week it to default values. Also have look with scope to the outputs.  the problems is that i cannot reproduce the error witk the manual slider in BF and ESC Configurator.
maybe its a protection. its seems like the motor wants to run higher rpm ( more pwm) and the sync/commutation  timer is on the old value.
i have to look also in the code what ramp-up power means exactly

Bluejay
 — 
14/08/2022
Ok. If you want to debug on your side please let me know. In that case you will need to use my branches of Betaflight and Bluejay

User
 — 
14/08/2022
I have the same Board on a Mobula6 with 26k Motors and had the problem also with 48 Khz Version and switched to 96Khz. the Problem is on the other build with 12.25 12k KV Motors. i will change to a Betafpv Board with o.h.5 Layout tomorrow  - i have to check if this Board has current sensing first.

User
 — 
hoy a las 6:39
Hi, i think i have found the problem. Sometimes when the motor is cold one phase has a short to the case . Same Motor which has sometimes Dshot errors in BF.

