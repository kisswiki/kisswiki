netsh advfirewall blocks ip, to block websites/hostnames/urls you need internet filter.


### ip not good

Windows firewall doesn't understand hostnames (www.example.com) only IPs (93.184.216.34)

The problem is, that depending on where you are in the world, and what Google datacenters are up/responding, the IP you get for www.google.com can vary greatly.  Also, you'd potentially be allowing more than just www.google.com as other services might also be hosted on the same IP, in the case of Google that can mean Google Talk, Gmail, Maps, etc, not just a Google search.

Also, some sites will need other domains (and IPs) available to work, for example, if you visit www.microsoft.com you also need all most of these others...

```
schemas.microsoft.com
www.w3.org
ajax.aspnetcdn.com
```

https://community.spiceworks.com/topic/1829632-netsh-advanced-firewall-to-block-website?page=1#entry-6206862

### Or use hosts file

- https://superuser.com/questions/988547/allow-only-white-listed-sites-on-windows-10
- https://github.com/evancz/airplane-mode/blob/master/Airplane%20Mode.app/Contents/Resources/script
- http://stackoverflow.com/questions/24048857/batch-files-to-create-and-delete-text-to-windows-hosts-file-with-task-scheduler

Or not

- https://softwarerecs.stackexchange.com/questions/17210/web-blocker-for-windows-to-avoid-procrastination

## Windows Firewall

- https://letitknow.wordpress.com/2012/09/13/manage-windows-firewall-with-powershell-3/

```powershell
Get-NetFirewallProfile -PolicyStore ActiveStore
Get-NetFirewallProfile -name Public -PolicyStore ActiveStore
Get-NetFirewallProfile -Name Public | Get-NetFirewallRule
Get-Command *-*firewall*
Get-NetFirewallProfile | fl *
Get-NetFirewallProfile -name public
Set-NetFirewallProfile -name * -Enabled "false"
Set-NetFirewallProfile -All -Enabled "true"
Set-NetFirewallProfile -name domain -DefaultInboundAction Block -DefaultOutboundAction Block
Set-NetFirewallProfile -name domain -DisabledInterfaceAliases Ethernet
Set-NetFirewallProfile -name domain -DisabledInterfaceAliases NotConfigured
Set-NetFirewallProfile -name domain -AllowUnicastResponseToMulticast false -NotifyOnListen false
Show-Command Get-NetFirewallRule
```


```cmd
nslookup malwaretips.com
nslookup malwaretips.com 8.8.8.8
```

```
netsh advfirewall /?
netsh advfirewall show currentprofile
netsh advfirewall firewall show rule name="all"
```

```
firewall.cpl
```

- parse the results of netsh advfirewall command to workable powershell objects using regex http://powershelldistrict.com/netsh-advfirewall-powershell/
- When you have several people that need to maintain the list of IP addresses that are allowed to connect https://www.leaseweb.com/labs/2014/02/powershell-windows-firewall/

## netsh firewall vs advfirewall

The firewall team is pushing everyone to using netsh advfirewall because netsh firewall cannot:

- enable groups of rules
- create rules for services
- create rules that support multiple filtering criteria

https://social.technet.microsoft.com/Forums/en-US/56cd9ed2-24ea-4ddf-90fc-c37de99296bc/ping-netsh-firewall-vs-advfirewall

## default firewall rules

```
netsh advfirewall export "C:\Archive\firewall-config.wfw"
netsh advfirewall reset
```

```powershell
(New-Object -ComObject HNetCfg.FwPolicy2).RestoreLocalFirewallDefaults()
```

http://theitbros.com/reset-windows-10-firewall-settings-default/

## "default action" of inbound connections to "Block"

`netsh advfirewall set currentprofile firewallpolicy blockinbound,allowoutbound`

http://stackoverflow.com/questions/40348194/windows-firewal-block-all-inbound-ports-and-allow-only-configured-ones

or

`netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound`

https://serverfault.com/questions/831739/editing-local-windows-firewall-policy-via-powershell

## turn off firewall

`Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False`

or

`netsh advfirewall set allprofiles state off`

https://www.faqforge.com/windows/turn-off-firewall-using-powershell-command-prompt/

## capture the activity of Windows Filtering Platform (WFP) (which the firewall employs) using the following commands:

```
netsh wfp capture start
netsh wfp capture stop
```

https://superuser.com/questions/451862/windows-firewall-blocks-outbound-connection-that-is-allowed-by-a-rule?rq=1

## block all

`netsh advfirewall set currentprofile firewallpolicy blockinbound,blockoutbound`

##

`New-NetFirewallRule -DisplayName "_Block 146.185.220.0/23" -Direction Outbound –LocalPort Any -Protocol TCP -Action Block -RemoteAddress 146.185.220.0/23`

Multiple addresses can be added comma separated
```
New-NetFirewallRule -DisplayName "_Block Rule" -Direction Outbound –LocalPort Any -Protocol TCP -Action Block -RemoteAddress 146.185.220.0/23,10.0.0.0/23
```

If does only accept IP address and some keywords (same as the Predefined set of computers section on the Scope tab of a rule) ;
Addresses may be specified as IP addresses, ranges, or subnets.  Also, the following address keywords are allowed in certain places:

LocalSubnet, DNS, DHCP, WINS, DefaultGateway, Internet, Intranet, IntranetRemoteAccess, PlayToDevice.  Keywords can be restricted to IPv4 or IPv6 by appending a 4 or 6.
Better to block these on the firewall as then only one list needs maintaining.

https://social.technet.microsoft.com/Forums/windows/en-US/3ff5beef-46be-4452-8ae0-1795fba1acca/using-powershell-ise-to-create-firewall-rule-to-block-url-and-ip-range?forum=win10itprosecurity

## netsh - allow the connection if secure

`security=authenc` with either `action=allow` or `action=bypass` depending upon your particular requirements.

http://stackoverflow.com/questions/40525189/netsh-advfirewall-firewall-set-allow-if-encrytped

## netsh - block URL from firewall

You can use nslookup to do this or some other ip resolver

https://superuser.com/questions/1088998/netsh-command-to-block-url-from-firewall

## Windows network has 3 network types, domain, private and public

Windows network has 3 network types, domain, private and public. Work and home are similar and are labeled as 'private' under it's firewall tool. The private setting is set to allow 'network discovery', so that Windows is allowed to talk to other PCs. The public setting is the most secure and is meant to be used at cafe hotspots, airports etc. If your network contains insecure PCs, then you should set the network profile to public.

http://hardenwindows10forsecurity.com/

## Comma is a special character for PowerShell

In your case it is interpreted as a binary array operator. It creates array with two elements blockinboundalways and allowoutbound. PowerShell below v5 will separate array elements with space when array passed to native applications. The resulting command line passed to netsh will be following:

Which is not what you want. You have to escape comma or enclose it in quotes to interpret it literally:

```
netsh advfirewall set allprofiles firewallpolicy blockinboundalways`,allowoutbound
netsh advfirewall set allprofiles firewallpolicy 'blockinboundalways,allowoutbound'
```

https://superuser.com/questions/1010411/command-executes-fine-through-cmd-but-not-through-powershell

## squid


### SSl

Seems like nginx does not support forward proxy mode with SSL. You will need to use something like Squid instead. Here is a link with more explanation from nginx's author: HTTPS and nginx as Forward Proxy.

https://superuser.com/questions/604352/nginx-as-forward-proxy-for-https

### wildcards

Wildcards other than leading dot (.) are not supported in Squid's dstdomain acl. See http://wiki.squid-cache.org/SquidFaq/SquidAcl#How_do_I_implement_an_ACL_ban_list.3F

https://serverfault.com/questions/838738/how-wildcards-works-in-squid-whitelisting-configuration

## block website

open this file `/etc/squid3/squid.conf`

add these lines:

```
acl bad_url dstdomain "/etc/squid3/bad-sites.acl"
http_access deny bad_url
```

then go to `/etc/squid3/bad-sites.acl` and add domains with this format

```
.google.com
.msn.com
.app.facebook.com
```

- http://stackoverflow.com/questions/8943381/how-to-block-website-using-squid-server
- https://softwarerecs.stackexchange.com/questions/17210/web-blocker-for-windows-to-avoid-procrastination

## block all site except some

in your `squid.conf` using an acl like

```
acl whitelist dstdomain "/etc/squid/whitelist"
http_access deny !whitelist
```

and a `whitelist` that looks like

```
.slashdot.org
.linuxquestions.org
```

- http://www.linuxquestions.org/questions/linux-networking-3/squid-acl-how-to-block-all-site-except-some-128024/
- http://stackoverflow.com/questions/2385248/how-to-block-all-connection-in-squid
