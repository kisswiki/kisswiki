The main practical difference is that AVR is already out of its prime, to be replaced with ARM Cortex-M series pretty much everywhere pretty soon (well, “pretty soon” ~= “in 10–20 years”, it doesn’t work faster than that).

Now to more technical differences:

- AVR exists in both 8-bit (with 16-bit address space) and 32-bit, ARM only as 32-bit (and 64-bit but this is not really for embedded). This has implications for the programming (8-bit CPUs usually can’t afford fully flat memory model, which leads to strange complications such as moving all variables from ROM into RAM on program start, routinely performed by AVR8 runtime).
- power-wise, I’ve seen even a 8-bit AVR being more power-hungry than an equivalent 32-bit ARM Cortex-M0 (that’s hertz-by-hertz, and if we count in 32-bit ALU on Cortex, depending on what-we’re-doing, the difference can become huge); YMMV, but what is clear that they’re at least comparable. And if we’re comparing AVR32 to 32-bit ARM, comparable ARM will win power-wise almost for sure.
- ARM Cortex M0 (32-bit) can be found for as little as [57 cents](https://www.mouser.at/ProductDetail/NXP-Semiconductors/LPC804M101JDH24J?qs=sGAEpiMZZMve4%2fbfQkoj%252bCNct1C5BkdL6PcHsFDkwG4%3d); comparable AVR will cost [91 cents](https://www.mouser.at/Semiconductors/Embedded-Processors-Controllers/_/N-6hpef?Keyword=avr&FS=True) (almost 2x more), and will have only 8-bit ALU opposed to 32-bit one in ARM. Make your own price research, but contrary to many claims, price-wise they’re at least comparable (with ARM Cortex M0 often winning over AVR).
- compiling for AVR requires avr-gcc while for ARM stock gcc (and reportedly Clang) can be used
- ARM Cortex-M0 is just the bottom step in the whole ARM Cortex M ladder. It means that for pretty much any task, there is an appropriate ARM CPU out there (while AVR stops at something along the lines of 512K Flash/64K RAM for ~7EUR, which is quite decent for embedded, but still no match for ARM Cortex-M7 which can be found in the wild @ up to 2M Flash/1M RAM, that’s for ~15 EUR - which is twice more expensive, but has 16x more RAM than topmost AVR(!!)).
- One example: ARM Cortex-M4F and Cortex-M7 have an FPU, so if you need floating point at a decent pace, you’re still in luck (not so with AVR)
- Another example: ARM Cortex M3 and higher may (and usually do) have a memory protection unit.
- ARM Cortex-M is produced by a dozen companies (including monsters such as STM, SiLabs, TI, and NXP), while AVR is a proprietary technology by Microchip/Atmel. BTW, even Microchip doesn’t bet everything on AVR, also producing ARM.

In short: differences, if any, are usually in favor of ARM; as a result,

if starting pretty much any new development, I’d clearly choose ARM Cortex M over AVR; there is simply no need to use AVR (which used to be a very nice architecture for its time BTW), in 2019+. One potential exception: at ultra-small sizes (like <512 bytes of RAM), AVR8 might still be a better option power-wise for some very corner cases; this hypothesis is still to be tested though.

https://www.quora.com/What-is-the-difference-between-AVR-and-ARM/answer/Sergey-Ignatchenko

##

AVR isn't looking too good right now. There is an out-of-tree Rust backend that should get merged soon (this year), but I think even Arduino is moving towards ARM.

To add to this, by this point AVR isn't even cheaper than ARM anymore, and hasn't been for a while; there aren't many reasons left to go with AVR if you don't have an existing design you want to support. Rust works best with 32/64-bit targets, and ARM microcontrollers tend to be significantly (at least 1-2 orders of magnitude) faster than AVR ones, as well as have more capable peripherals, all while consuming much less power.

The reasons to go for AVR I can think of are mainly:

- AVR is much simpler. STM32F devices, for example, have massive datasheets and a dazzling set of peripherals with lots of features, which can be intimidating to a learner.
- There are many 5 V AVR devices, but I can't think of any 5 V Cortex-M device. (There are definitely some with 5 V tolerant pins, which is different.) However, 5 V IO is getting less common.

[This](https://www.nxp.com/products/processors-and-microcontrollers/arm-microcontrollers/general-purpose-mcus/ke-series-cortex-m4-m0-plus:KINETIS_E_SERIES) is apparently a 5V Cortex-M series from NXP. First Google hit on "5 volt cortex m". A quick scan of a datasheet makes me think that the output pins are 5V when the chip is powered at 5V, but I could be misreading that.

Yeah, I've since been told of multiple families of 5 V Cortex-M devices; Microchip and Nuvoton also make those.

https://www.reddit.com/r/rust/comments/eq6eeq/which_microcontrollers_are_best_for_rust_avr_vs/
