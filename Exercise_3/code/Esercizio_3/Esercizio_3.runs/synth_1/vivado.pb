
?
Command: %s
1870*	planAhead2?
?read_checkpoint -auto_incremental -incremental D:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/utils_1/imports/synth_1/orologio.dcp2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2f
RD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/utils_1/imports/synth_1/orologio.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
v
Command: %s
53*	vivadotcl2E
1synth_design -top orologio -part xc7a100tcsg324-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px? 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px? 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
44482default:defaultZ8-7075h px? 
?
%s*synth2?
wStarting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1277.109 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
orologio2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
572default:default8@Z8-638h px? 
n
%s
*synth2V
B	Parameter clock_frequency_in bound to: 50000000 - type: integer 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter clock_frequency_out bound to: 1 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
div_frequenza2default:default2a
MD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/div_frequenza.vhd2default:default2
342default:default2)
divisore_di_frequenza2default:default2!
div_frequenza2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1302default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
div_frequenza2default:default2c
MD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/div_frequenza.vhd2default:default2
442default:default8@Z8-638h px? 
n
%s
*synth2V
B	Parameter clock_frequency_in bound to: 50000000 - type: integer 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter clock_frequency_out bound to: 1 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
div_frequenza2default:default2
02default:default2
12default:default2c
MD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/div_frequenza.vhd2default:default2
442default:default8@Z8-256h px? 
W
%s
*synth2?
+	Parameter M bound to: 60 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter N bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

cont_mod_M2default:default2^
JD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/cont_mod_M.vhd2default:default2
282default:default2%
contatore_secondi2default:default2

cont_mod_M2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1402default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2

cont_mod_M2default:default2`
JD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/cont_mod_M.vhd2default:default2
432default:default8@Z8-638h px? 
W
%s
*synth2?
+	Parameter M bound to: 60 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter N bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
input2default:default2`
JD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/cont_mod_M.vhd2default:default2
582default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2

cont_mod_M2default:default2
02default:default2
12default:default2`
JD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/cont_mod_M.vhd2default:default2
432default:default8@Z8-256h px? 
W
%s
*synth2?
+	Parameter M bound to: 60 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter N bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

cont_mod_M2default:default2^
JD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/cont_mod_M.vhd2default:default2
282default:default2$
contatore_minuti2default:default2

cont_mod_M2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1532default:default8@Z8-3491h px? 
W
%s
*synth2?
+	Parameter M bound to: 24 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter N bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

cont_mod_M2default:default2^
JD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/cont_mod_M.vhd2default:default2
282default:default2!
contatore_ore2default:default2

cont_mod_M2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1662default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2.
cont_mod_M__parameterized22default:default2`
JD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/cont_mod_M.vhd2default:default2
432default:default8@Z8-638h px? 
W
%s
*synth2?
+	Parameter M bound to: 24 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter N bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
input2default:default2`
JD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/cont_mod_M.vhd2default:default2
582default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2.
cont_mod_M__parameterized22default:default2
02default:default2
12default:default2`
JD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/cont_mod_M.vhd2default:default2
432default:default8@Z8-256h px? 
V
%s
*synth2>
*	Parameter N bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
loading_time2default:default2`
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
342default:default2
load_sec2default:default2 
loading_time2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1852default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2 
loading_time2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
472default:default8@Z8-638h px? 
V
%s
*synth2>
*	Parameter N bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
loading_time2default:default2
02default:default2
12default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
472default:default8@Z8-256h px? 
V
%s
*synth2>
*	Parameter N bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
loading_time2default:default2`
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
342default:default2
load_min2default:default2 
loading_time2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1972default:default8@Z8-3491h px? 
V
%s
*synth2>
*	Parameter N bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
loading_time2default:default2`
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
342default:default2
	load_hour2default:default2 
loading_time2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
2092default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
orologio_board2default:default2b
ND:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio_board.vhd2default:default2
342default:default2
display2default:default2"
orologio_board2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
2212default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2"
orologio_board2default:default2d
ND:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio_board.vhd2default:default2
462default:default8@Z8-638h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
dots2default:default2d
ND:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio_board.vhd2default:default2
822default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2"
orologio_board2default:default2
02default:default2
12default:default2d
ND:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio_board.vhd2default:default2
462default:default8@Z8-256h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
set_h2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
2322default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
set_m2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
2322default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
set_s2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
2322default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
orologio2default:default2
02default:default2
12default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
572default:default8@Z8-256h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
set2default:default2 
loading_time2default:defaultZ8-7129h px? 
?
%s*synth2?
wFinished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1277.109 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1277.109 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1277.109 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0052default:default2
1277.1092default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2?
lD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-100T-Master.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2?
lD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-100T-Master.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2?
lD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-100T-Master.xdc2default:default2.
.Xil/orologio_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1298.8592default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1298.8592default:default2
0.0002default:defaultZ17-268h px? 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1298.859 ; gain = 21.750
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1298.859 ; gain = 21.750
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1298.859 ; gain = 21.750
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
!inferring latch for variable '%s'327*oasys2

VALUEs_reg2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1482default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2

VALUEm_reg2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1612default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2

VALUEh_reg2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1742default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1298.859 ; gain = 21.750
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   26 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit       Adders := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               26 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                6 Bit    Registers := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 4     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   26 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    8 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	  11 Input    8 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit        Muxes := 18    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
?
+design %s has port %s driven by constant %s3447*oasys2
orologio2default:default2
an[7]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2
orologio2default:default2
an[6]2default:default2
12default:defaultZ8-3917h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:21 ; elapsed = 00:00:21 . Memory (MB): peak = 1298.859 ; gain = 21.750
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:27 ; elapsed = 00:00:27 . Memory (MB): peak = 1298.859 ; gain = 21.750
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Timing Optimization : Time (s): cpu = 00:00:28 ; elapsed = 00:00:28 . Memory (MB): peak = 1316.418 ; gain = 39.309
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
#contatore_ore/internal_y_reg[5]_LDC2default:default2
orologio2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys25
!contatore_ore/internal_y_reg[5]_P2default:default2
orologio2default:defaultZ8-3332h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Technology Mapping : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1316.418 ; gain = 39.309
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
uFinished IO Insertion : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 1318.070 ; gain = 40.961
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 1318.070 ; gain = 40.961
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[5]2default:default2
1st2default:default2,
load_sec/valore_reg[5]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[5]2default:default2
2nd2default:default2#
VALUEs_reg[5]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1482default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[4]2default:default2
1st2default:default2,
load_sec/valore_reg[4]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[4]2default:default2
2nd2default:default2#
VALUEs_reg[4]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1482default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[3]2default:default2
1st2default:default2,
load_sec/valore_reg[3]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[3]2default:default2
2nd2default:default2#
VALUEs_reg[3]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1482default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[2]2default:default2
1st2default:default2,
load_sec/valore_reg[2]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[2]2default:default2
2nd2default:default2#
VALUEs_reg[2]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1482default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[1]2default:default2
1st2default:default2,
load_sec/valore_reg[1]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[1]2default:default2
2nd2default:default2#
VALUEs_reg[1]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1482default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[0]2default:default2
1st2default:default2,
load_sec/valore_reg[0]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
out_time[0]2default:default2
2nd2default:default2#
VALUEs_reg[0]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1482default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[5]2default:default2
1st2default:default2,
load_min/valore_reg[5]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[5]2default:default2
2nd2default:default2#
VALUEm_reg[5]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1612default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[4]2default:default2
1st2default:default2,
load_min/valore_reg[4]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[4]2default:default2
2nd2default:default2#
VALUEm_reg[4]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1612default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[3]2default:default2
1st2default:default2,
load_min/valore_reg[3]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[3]2default:default2
2nd2default:default2#
VALUEm_reg[3]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1612default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[2]2default:default2
1st2default:default2,
load_min/valore_reg[2]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[2]2default:default2
2nd2default:default2#
VALUEm_reg[2]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1612default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[1]2default:default2
1st2default:default2,
load_min/valore_reg[1]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[1]2default:default2
2nd2default:default2#
VALUEm_reg[1]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1612default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[0]2default:default2
1st2default:default2,
load_min/valore_reg[0]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEm[0]2default:default2
2nd2default:default2#
VALUEm_reg[0]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1612default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[5]2default:default2
1st2default:default2-
load_hour/valore_reg[5]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[5]2default:default2
2nd2default:default2#
VALUEh_reg[5]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1742default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[4]2default:default2
1st2default:default2-
load_hour/valore_reg[4]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[4]2default:default2
2nd2default:default2#
VALUEh_reg[4]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1742default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[3]2default:default2
1st2default:default2-
load_hour/valore_reg[3]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[3]2default:default2
2nd2default:default2#
VALUEh_reg[3]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1742default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[2]2default:default2
1st2default:default2-
load_hour/valore_reg[2]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[2]2default:default2
2nd2default:default2#
VALUEh_reg[2]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1742default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[1]2default:default2
1st2default:default2-
load_hour/valore_reg[1]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[1]2default:default2
2nd2default:default2#
VALUEh_reg[1]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1742default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[0]2default:default2
1st2default:default2-
load_hour/valore_reg[0]/Q2default:default2b
LD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/loading_time.vhd2default:default2
562default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
	VALUEh[0]2default:default2
2nd2default:default2#
VALUEh_reg[0]/Q2default:default2^
HD:/Progetti_VHDL/Esercizio_3/Esercizio_3.srcs/sources_1/new/orologio.vhd2default:default2
1742default:default8@Z8-6859h px? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|       18|Failed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 1318.070 ; gain = 40.961
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 1318.070 ; gain = 40.961
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 1318.070 ; gain = 40.961
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 1318.070 ; gain = 40.961
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |    12|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |     3|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |    28|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |    42|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |    32|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |    41|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |    63|
2default:defaulth px? 
D
%s*synth2,
|9     |MUXF7  |     9|
2default:defaulth px? 
D
%s*synth2,
|10    |MUXF8  |     1|
2default:defaulth px? 
D
%s*synth2,
|11    |FDCE   |    83|
2default:defaulth px? 
D
%s*synth2,
|12    |FDPE   |    17|
2default:defaulth px? 
D
%s*synth2,
|13    |FDRE   |     3|
2default:defaulth px? 
D
%s*synth2,
|14    |LD     |    18|
2default:defaulth px? 
D
%s*synth2,
|15    |LDC    |    17|
2default:defaulth px? 
D
%s*synth2,
|16    |IBUF   |    29|
2default:defaulth px? 
D
%s*synth2,
|17    |OBUF   |    16|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 1318.070 ; gain = 40.961
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
s
%s
*synth2[
GSynthesis finished with 0 errors, 36 critical warnings and 8 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:24 ; elapsed = 00:00:32 . Memory (MB): peak = 1318.070 ; gain = 19.211
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 1318.070 ; gain = 40.961
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1330.1372default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
572default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1333.8552default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2w
c  A total of 35 instances were transformed.
  LD => LDCE: 18 instances
  LDC => LDCE: 17 instances
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
a72517f92default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
412default:default2
152default:default2
362default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:382default:default2
00:00:402default:default2
1333.8552default:default2
56.7462default:defaultZ17-268h px? 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2V
BD:/Progetti_VHDL/Esercizio_3/Esercizio_3.runs/synth_1/orologio.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2z
fExecuting : report_utilization -file orologio_utilization_synth.rpt -pb orologio_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Nov  3 22:12:11 20222default:defaultZ17-206h px? 


End Record