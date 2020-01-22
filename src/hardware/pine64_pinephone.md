- https://store.pine64.org/?product=pinetime-dev-kit
- [What's the bin flashed on the devKit?](https://forum.pine64.org/showthread.php?tid=8114&pid=51139)
  - https://www.reddit.com/r/pinetime/comments/esbieb/mine_just_arrived_do_you_have_any_tipps_where_to/ff939hu/
- https://twitter.com/MisterTechBlog
- https://medium.com/swlh/sneak-peek-of-pinetime-smart-watch-and-why-its-perfect-for-teaching-iot-81b74161c159
  - PineTime is the spiritual successor to BBC micro:bit (the educational gadget)!
  - With PineTime we get a supercharged nRF52 and proper Bluetooth support, including Bluetooth Mesh! 
  - connect a $2 ST-Link dongle [st-link v2](https://www.aliexpress.com/wholesale?catId=0&initiative_id=SB_20180924134644&SearchText=st-link+v2&switch_new_app=y)
  - PineTime was created for Embedded Rust!
- https://medium.com/@ly.lee/building-a-rust-driver-for-pinetimes-touch-controller-cbc1a5d5d3e9
- https://medium.com/@ly.lee/porting-druid-rust-widgets-to-pinetime-smart-watch-7e1d5a5d977a
- https://wiki.pine64.org/index.php/PineTime
- https://wiki.pine64.org/index.php/Frequently_asked_questions_about_the_PineTime
- https://en.m.wikipedia.org/wiki/Pine_Microsystems#Smartwatch
- https://tuxphones.com/pine64-pinetime-open-source-smartwatch-specs-price-release-date-pictures/
- https://twitter.com/thepine64/status/1172648370550136832
- The development kit for the PINE64 PineTime will become available within a month, in October 2019, whereas the expected release date for the final product will be in Q1 or Q2 2020, pending on development results. https://tuxphones.com/pine64-pinetime-open-source-smartwatch-specs-price-release-date-pictures/
- https://liliputing.com/2019/09/pinetime-is-a-25-smartwatch-companion-for-linux-smartphones-work-in-progress-from-pine64.html
- https://www.reddit.com/r/pinetime/
- https://www.reddit.com/r/PINE64official/

- https://www.forbes.com/sites/jasonevangelho/2019/09/14/meet-pinetime-a-linux-smartphone-companion-you-can-definitely-afford/
  - PineTime watch uses the same body/chassis, but not internals. https://www.aliexpress.com/item/32933638584.html?srcSns=sns_Copy&tid=white_backgroup_101&mb=42zWXKmnLq7GYoO&tt=sns_Copy&aff_platform=default&cpt=1568462810995&sk=4nWpddGy&aff_trace_key=28e6938963434e24aea97f4a9e5c2db7-1568462810995-08181-4nWpddGy&businessType=ProductDetail&platform=AE&terminal_id=7b1352c9e47843978c34bb59cfcf1fc0

- https://forum.pine64.org/forumdisplay.php?fid=134
- https://medium.com/@ly.lee/debug-rust-mynewt-firmware-for-pinetime-on-raspberry-pi-4b9ac2d093a9

- https://www.reddit.com/r/pinetime/comments/eq76d2/pinetime_flashing_with_raspberry_pi_over_spi/

- https://medium.com/@ly.lee/porting-druid-rust-widgets-to-pinetime-smart-watch-7e1d5a5d977a
  - quite big lag [PineTime [druid] touch widgets - YouTube](https://www.youtube.com/watch?v=7nXJdW_GkEw) 

- https://tuxphones.com/yet-another-librem-5-and-pinephone-linux-smartphone-comparison/

- Bettery drained after 7 hours [Battery discharge curve](https://forum.pine64.org/showthread.php?tid=8147)
  - As for methodology: I charged the PineTime for about 3 hours so it must be completely full. Before measurements started, there was maybe a gap of one or two minutes. The screen was on all the time (refreshing every ~10 seconds) and LCD_BACKLIGHT_HIGH was on all the time as well. The CPU was in sleep mode most of the time between displaying the results. However, it was connected with a debug wire which AFAIK prevents the CPU from going to sleep. Measurements were sent to the host using ARM Semihosting.
To my surprise, it still took almost 7 hours for the battery to run empty.
  - The pinetime-devkit0 lacks a discharging protection, so that graph suggests to firmware developers to cut off consumptions at +/- 3.55V disabling devices and indicating about current operation mode and state.
  - http://files.pine64.org/doc/PineTime/PineTime%20Port%20Assignment%20rev1.0.pdf
  - http://files.pine64.org/doc/PineTime/PinTime%20Schematic-V1.0-20191020.pdf
  - On the schematic, you can see the pin 0.27 on the MCU that is "connected" to LED13, but it's written "NC" (Not connected ?) 
  - Neither the LED or the current limiting resistor are populated / connected!

## Mynewt

With a cooperative task scheduler like cocoOS, the firmware needs to be designed carefully before coding. Which could be a problem if you’re not an embedded software architect. So I switched to an open source Real Time Operating System that supports preemptive multitasking: Apache Mynewt…

Best thing about Arduino: Arduino drivers are available for all kinds of sensors. (Even though many Arduino drivers use dodgy Bit Banging.) When we move out of Arduino, we face problems finding drivers…

Apache Mynewt is an open-source Real Time Operating System that has built-in drivers for many types of sensors. So I shifted from Arduino and cocoOS to Mynewt…

Arduino Uno is a Dead End for IoT Education: Hard to create affordable commercial products at volume. (Same for BBC micro:bit.) And Bit-Banging in C is just bad for IoT learners. So I taught myself STM32 Blue Pill. The tiny development board contains a 32-bit Arm microcontroller by STMicro with proper ports for UART, I2C, SPI, USB, CAN, … Costs only US$ 2 (or 5 pieces for S$ 16)

STM32 Blue Pill passes my “Taobao Benchmark” with flying colours, so no worries about commercialising your IoT gadget. Hard to find coding tutorials for STM32 Blue Pill, so I wrote many, many STM32 Blue Pill coding tutorials in C and Rust (and some translated into Chinese)…

https://medium.com/@ly.lee/my-5-year-iot-mission-5f2f28348780

- Just pick a sensor driver from their library https://news.ycombinator.com/item?id=20152450
  - https://github.com/apache/mynewt-core/tree/master/hw/drivers/sensors
  - https://twitter.com/rofrol/status/1220064015898030082

- https://medium.com/@ly.lee/bluetooth-mesh-with-nrf52-and-apache-mynewt-44823407c471
  - How far they can communicate to each other? https://www.youtube.com/watch?v=5W9GteiLClg&lc=UgzSRUc2ZjSXAAOtHZV4AaABAg

## Nordic nRF52832

Nordic nRF52832 could become my preferred development board because it has Bluetooth and more RAM/ROM than STM32 Blue Pill. 32-bit Arm microcontroller, 512 KB flash ROM, 64 KB RAM. More expensive than STM32 Blue Pill of course (US$ 7 on Taobao). Because we are coding with Apache Mynewt OS and calling the same APIs for GPIO, I2C, SPI, etc so the code for STM32 Blue Pill also works on Nordic nRF52.

https://medium.com/@ly.lee/my-5-year-iot-mission-5f2f28348780

nRF52 is similar to other microcontrollers (like the STM32 F103 found in Blue Pill)… Except that the nRF52 has 2.4 GHz Radio capabilities not found in most other microcontrollers.

2.4 GHz is used for WiFi… Does this mean that the nRF52 can talk WiFi?

Not quite… WiFi protocols are highly complex, beyond what the nRF52 can handle. Specialised microcontrollers like ESP8266 are better at handling WiFi.

But nRF52 is perfect for Bluetooth Low Energy (LE) protocols, including iBeacon. Note that Bluetooth LE is not compatible with the older standard Bluetooth. So we can’t operate our nRF52 like a classic Bluetooth tethered network device.

nRF52 doesn’t come with hardcoded firmware that enables the Bluetooth LE functions… We need to load our own Bluetooth LE firmware. Let’s discuss two options: Nordic SoftDevice and Apache NimBLE.

https://medium.com/@ly.lee/coding-nrf52-with-rust-and-apache-mynewt-on-visual-studio-code-9521bcba6004

## micro:bit

BBC micro:bit is based on Nordic nRF51, the weaker predecessor of nRF52. That’s why micro:bit feels a little wonky sometimes…

https://medium.com/@ly.lee/my-5-year-iot-mission-5f2f28348780

## Other OS-es

- Zephyr https://github.com/najnesnaj/pinetime-zephyr
  - a modern open source RTOS that is supported by the microcontroller companies: STMicro, Nordic, NXP, … https://medium.com/@ly.lee/my-5-year-iot-mission-5f2f28348780
- TinyGo https://github.com/aykevl/go-smartwatch
- FreeRTOS https://github.com/JF002/Pinetime

https://www.reddit.com/r/nRF52/comments/emiwop/build_and_flash_rustmynewt_firmware_for_pinetime/fdsqblu/

## Rust

The best way forward I think: Get embedded app developers to move away from C and port their embedded apps to Rust. Build the apps with safe Rust wrappers on top of the OS.

Once we figure out what kind of APIs the embedded Rust apps really need (e.g. Sensor Framework), then we dig deeper and restructure the OS with Rust. This could work with any embedded OS: Mynewt, Zephyr, FreeRTOS, ... 

I'm the author and I have seen my IoT students suffer while learning Arduino programming. So my article was really about the bad C coding in Arduino: pointers, bit-banging, ...

But really... we have suffered with C for so many years, why haven't we moved on to Rust? 

https://news.ycombinator.com/item?id=20151147

Why not switch from C to Rust, the safer, modern alternative? The Rust compiler stops you from using bad pointers (unless you mark it unsafe). It compiles into efficient Arm machine code. Works well with C libraries and drivers (like Mynewt). And well supported by open-source coding tools like Visual Studio Code. We can run pure Embedded Rust...

Visual Rust!!! like blockly and Scratch

I’m keen to roll out Visual Rust but it’s hard for me to do this alone. Lemme know if you can help!

https://medium.com/@ly.lee/my-5-year-iot-mission-5f2f28348780

- About Rust and bootloader [official software project ? (Rust for IOT ?)](https://forum.pine64.org/showthread.php?tid=8375)

## Debugging, flashing and testing

- The PineTime Dev Kit comes with 4 pin SWD cable and does not comes with SWD debugger.  Developer needs to source their own SWD debugger.
- https://wiki.pine64.org/index.php/PineTime
  - Connect the Pinetime SWD pins to the debugger (P20 on NRF52-DK) 
    - https://www.nordicsemi.com/Software-and-Tools/Development-Kits/nRF52-DK
    - https://electronics.stackexchange.com/questions/53571/jtag-vs-swd-debugging
    - https://www.reddit.com/r/pinetime/comments/es9lse/pinetime_debugger_is_now_available/
    - Using only a Raspberry Pi, we may debug the firmware on PineTime Smart Watch https://medium.com/@ly.lee/debug-rust-mynewt-firmware-for-pinetime-on-raspberry-pi-4b9ac2d093a9
- connect a $2 ST-Link dongle [st-link v2](https://www.aliexpress.com/wholesale?catId=0&initiative_id=SB_20180924134644&SearchText=st-link+v2&switch_new_app=y)
  - https://medium.com/swlh/sneak-peek-of-pinetime-smart-watch-and-why-its-perfect-for-teaching-iot-81b74161c159

the only real difference with the PineTime dev kit is that it comes with the SWD cable/connector (but you need to provide the debugger/programmer) and it isn’t a sealed unit, so that you can actually access the debug connector.

https://www.pine64.org/2019/12/05/december-update-thank-you-for-2019/#comment-836

Great News! I have successfully modded OpenOCD on Raspberry Pi to perform SWD flashing over the super-reliable SPI port, instead of the unreliable GPIO pins (bit banging). Works OK for flashing nRF52 firmware, I'm now testing VSCode with gdb debugging.

Raspberry Pi becomes a one-stop IoT workstation for Coding, Building, Flashing AND Debugging PineTime Firmware... Amazing! 🤩

Turbocharged the SPI speed from 1.9 MHz to 31 MHz... And app flashing still works! Fastest OpenOCD flasher ever for Raspberry Pi! (It fails at 62 MHz)


- https://www.reddit.com/r/PINE64official/comments/epgov4/pinetime_flashing_with_raspberry_pi_over_spi/
- https://www.reddit.com/r/pinetime/comments/eq76d2/pinetime_flashing_with_raspberry_pi_over_spi/


It also confirmed my suspicions that most SPI peripherals are not really SPI compatible... https://www.reddit.com/r/rust/comments/egy80q/optimising_pinetimes_display_driver_with_rust_and/fclnbbw/


I get that when the SWD pins are not firmly connected. Try checking the pins.

That's why I use super-stiff 22 AWG wires... So they won't slip away! 😀

https://www.reddit.com/r/nRF52/comments/emiwop/build_and_flash_rustmynewt_firmware_for_pinetime/feg1o0j/


The generic ST-Link V2 USB Adapter costs under $2 (search AliExpress for st-link v2) and works perfectly fine for flashing and debugging the nRF52… Except for removing nRF52 flash protection.

How is ST-Link different from J-LINK, since both are used for flashing and debugging Arm microcontrollers?

ST-Link and J-LINK are both Arm SWD (Serial Wire Debug) Programmers. ST-Link is known as a High-Level Adapter… ST-Link doesn’t implement all SWD functions, just the minimal set of high-level functions needed for flashing and debugging. Thus ST-Link can’t be used for removing the nRF52 flash protection.

If your nRF52 flash ROM is protected (and ST-Link refuses to flash your device), you may use a Raspberry Pi to remove the protection.

This only needs to be done once (and ST-Link will work fine after that).

https://medium.com/hacksters-blog/raspberry-pi-based-jig-for-testing-a-custom-esp32-development-board-3405c573f796

## Development setup

"Regarding the protection bit, one thing to be aware of is that the ST-LINK V2 (and its various clones) are what OpenOCD calls a "high-level adapter." What does that mean?
The ST-LINK V2 is basically an ST Micro ARM chip running some special firmware which is designed specifically for programming/debugging ARM chips that support the Serial Wire Debug (SWD) interface and protocol. (SWD is a variant of JTAG that uses fewer pins.) The firmware accepts commands from a host computer via USB and then issues the corresponding SWD transactions to the device under test.

By contrast, you have things like the Olimex ARM-OCD-USB-H debugger which is considered a low-level adapter. This device contains an FTDI serial chip, which is basically a dumb device whose pins can be twiddled via host software. It doesn't know anything about SWD or JTAG protocols: the intelligence for that is all in the host software (in this case OpenOCD) and the software twiddles the pins to produce the correct signal patterns that correspond to the SWD transaction protocol.
The ST-LINK V2 is considered a high-level adapter because it accepts high-level commands from the host, and its functionality is limited by whatever the firmware developers decided to implement in it. The Olimex is a low-level debugger because you can basically do anything with it: it can support SWD, JTAG or custom protocols."


i used some enamel wires to connect the devKit to a cheap STLink clone

I think it's a good idea to solder wires to the programming pins so that you don't have to put your finger and hands on the PCB each time you want to program and debug the device !

Battery is just glued and can be lifted, just pull gently.

Mine actually came away too easily: the heartbeat sensor flex came away with it too Smile but that wasn't a problem, because you can locate the flex connector, gently lift the black part at the back, insert the flex into the front white part, press the black part back and all is good. 

I seriously recommend taping down the battery when you have put the debug cable in. The battery wires are super-thin and come off easily. 

J-Link EDU Mini -> 10-wire cable -> SWD breakout board -> DuPont wires -> 4-wire SWD cable (that came with the PineTime) -> PineTime.

Also, I have bent the antenna slightly to not be that close to the debug wires, to avoid shorts.

to see that the unlock is persistent over reboots, i had to do this 3 times before it actually persisted. now the raspberry pi part is over and i could start development with the stlink and my laptop instead.

if you hack a sealed PineTime and broke the update, this means you brick the device and becomes paper weight. 

[How to get started ? Share you development setup!](https://forum.pine64.org/showthread.php?tid=8129)

## J-Link

J-Link EDU Mini $19.95 

Unlimited Breakpoints - The unlimited breakpoints in flash memory feature can be used free of charge for evaluation. The evaluation period is not time limited. For commercial use a separate license is required. https://www.adafruit.com/product/3571

We do have the commercial version of the J-Link $399.95,

It's USB based and uses a high-speed MCU internally, not an FTDI convertor like most low cost debugger. More debugging, less waiting!

It includes flash-programming algorithms for most MCUs, and Segger is very pro-active about updating their drivers to support the newest chipsets.

programming the device via free tools over UART or via a USB bootloader, etc. -- but when you need to do that 40-50 times a day, it can get old quick, and 15 seconds saved make a huge difference when debugging. You can program a small MCU and break on main in 2-3 seconds with a J-Link, which makes the tools more or less invisible, which is a good thing when you have other problems to worry about.

https://www.adafruit.com/product/2209

## MicroPython

- [PineTime display and micropython](https://forum.pine64.org/showthread.php?tid=8836)
