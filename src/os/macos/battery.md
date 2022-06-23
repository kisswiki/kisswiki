## mds_stores high cpu usage

I do not have Time Machine enabled like here https://apple.stackexchange.com/questions/144474/mds-and-mds-stores-constantly-consuming-cpu/343222#343222.

I have excluded projects and personal_projects in `System Preferences > Spotlight > Privacy` but mds_stores was still using cpu much.

Then I disabled spotlight indexing with:

`sudo mdutil -a -i off`

https://apple.stackexchange.com/questions/144474/mds-and-mds-stores-constantly-consuming-cpu/144494#144494

Eventually I did `System Preferences > Spotlight > Uncheck every item except for “Applications” and “System Preferences”`

https://osxdaily.com/2010/07/06/turn-spotlight-into-an-application-launcher-only/

## Last lid open

uptime gives 3:58 hours. Last lid open 2 hours.

```shell
$ pmset -g log | grep " Wake  " | tail -n 1
2022-06-23 10:41:48 +0200 Wake                	Wake from Deep Idle [CDNVA] : due to SMC.OutboxNotEmpty smc.70070000 lid/HID Activity Using BATT (Charge:100%)
% uptime
12:43  up 20 days,  3:58, 6 users, load averages: 2.61 2.54 2.74

https://apple.stackexchange.com/questions/52064/how-to-find-out-the-start-time-of-last-sleep/84162#84162

## Links

- https://apple.stackexchange.com/questions/110780/how-to-know-the-duration-of-battery-usage-in-one-session
- [Determine battery cycle count for Mac notebooks - Apple Support](https://support.apple.com/en-us/HT201585)
- https://www.reddit.com/r/MacOS/comments/l3ykb1/battery_drain_on_bigsur_anyway_to_fix_this_return/
- https://www.reddit.com/r/MacOS/comments/mwoqji/macbook_airs_2018_battery_drain_this_happens_when/
- https://macmost.com/figuring-out-why-your-macbook-battery-drains-at-night.html
- https://9to5mac.com/2022/02/07/overnight-battery-drain-on-macbooks-fix/

## keep plugged or not

Handy Manny

Hello, hardware engineer here! Unfortunately, this video is spreading serious false information. If you want to preserve your battery’s life as much as possible, you ACTUALLY should leave it plugged in as much as possible. Your MacBook has circuitry to protect the battery from over or undercharging. So you never have to worry about leaving it plugged in too much, or even leaving it unplugged too long.

In fact, the far more important thing is to minimize cycles. A cycle is a full discharge, followed by a full charge. But partial charges and discharges count, so if you use 25% of the battery today and 75% of the battery tomorrow and then charge it to 100%, you would have done 1 cycle in 2 days. So the more you minimize cycles, the longer your battery will last. You minimize cycles by keeping your laptop plugged in as much as possible.

It should be noted the battery will degrade even when plugged in. Nothing can stop a battery from degrading over time. It doesn’t matter if you leave your laptop plugged in, or even if you shut down your laptop, unplug the power cord and don’t use it for a year. The battery will still degrade. It is the rate at which it degrades you are trying to impact. Due to the circuitry in the laptop that protects the battery, keeping it plugged in as much as possible is the best practice for the longest battery life.

https://www.youtube.com/watch?v=7oEVzYuuwh8

## car charger

LunarTerminator

I was able to come up with my own measurements to answer this question. I remembered that I had a device called a "Kill A Watt P3", that plugs between an electrical outlet and an appliance plug. It can give real time power consumption data. I plugged my Apple 96W power adapter into this and my 14" MacBook Pro with M1 Max, 64GB of memory, and 24 graphics cores (i.e. a nearly maxed out system) and took power measurements:

Battery 100% charged, power readings varied, the ones below are the peak powers observed

Lid closed. 5 W
Waking up, screen 50%: 14 W
Screen off: 9 W
Screen 50%: 11 W
Screen 100%: 18 W
Single core GeekBench 5: 24 W
Multi core GeekBench 5: 53 W

Battery 5% charged (i.e. fast charging)
Awake screen 50%: 96 W

My tentative conclusion is that even a maxed out 14" MacBook Pro should operate fine with a ~60 W + supply. Obviously fast charging will be limited by the power supply. There will be power transients that a device like the one I used will miss, but the battery should handle those fine if it has any charge at all. This means that it is likely that a pass through hub limited to 60W or one of the travel sized GaN 66W USB C supplies, should power any 14" MacBook Pro.

Grant Bennet-Alder

The problem with your measurements is that when the power required exceeds what is readily available through the power adapter, your Mac freely "borrows" additional needed power from the battery. This has been seen to cause the battery to discharge under certain heavy loads, even with the power adapter connected.

Apple does not publish the numbers for minimum power adapter required. They suggest that 90 plus Watts available through USB display should be adequate. Using too small a power supply may cause damage when running your computer and is not recommended.

Using a smaller power adapter as an emergency charger when your Mac is nominally OFF has never been reported to be a problem.

LunarTerminator

Thanks for the info. Your observation about the potential for pulling power from the battery as well is quite correct, but probably not an issue here. I should have been clearer that the 96W charger was used. With all the measurements so much below that (except for the rapid charge), it is unlikely that power was pulled from the battery in the other cases except for brief transients.

- https://discussions.apple.com/thread/253272027
- https://www.belkin.com/us/resource-center/gan-chargers/

i_rina

Usually it is not recommended that you charge your Mac using a car charger as it could cause issues to your vehicle's electrical systems. If you do have a need to charge the MacBook it is highly recommended that you use an inverter as there aren't very many safe alternatives to use.

https://discussions.apple.com/thread/252946829

Satechi also highlights that the charger itself is equipped with short circuit and over-temperature protection to deliver a safe charging experience, to help prevent overheating and a potential problem while you're driving.

- https://appleinsider.com/articles/19/08/27/hands-on-satechis-new-72w-charger-can-charge-your-macbook-on-the-go
- https://www.youtube.com/watch?v=0k98zrj0YyM

### Other

- https://pancernik.eu/ladowarka-samochodowa/xiaomi-car-charger-100w-usb-c-usb-a-cc07zm-czarna
- https://allegro.pl/oferta/100w-xiaomi-ladowarka-samochodowa-szybkiego-1a1c-10609522265
- https://pancernik.eu/ladowarka-samochodowa/baseus-superme-digital-display-pps-100w-usb-c-usb-a-czarna
- 139 zł https://www.cortland.pl/satechi-ladowarka-samochodowa-usb-c-usb-a-72w-czarny.html
- https://allegro.pl/oferta/mio-smartbox-zasilacz-na-stale-tryb-parkingowy-9524207539
```
