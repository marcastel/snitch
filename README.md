---
revision: 2019-10-27 (Sun) 23:54:58
---

<!-- # Contents -->

## Subscriptions for Little Snitch

Harden you macOS platform with these [Little Snitch][snitch] rule groups which can be subscribed to directly from within the
application -- see the _Rule groups_ section below.

### Motivation

The so-called _modern_ Internet (or Internet 2.0 as it was once called) is one in which you are no longer a mere mortal; you
become a guinea pig in constant experimentation where the end goal is to know everything about you, what you are doing, what you
are thinking, and possibly predicting your next thoughts and actions.

I hate being a guinea pig. I love Internet. I need a means of _recovering_ my Internet freedom, without being _under cover_ all
the time -- and by the way, so-called _private surfing_ is not really private because it makes the assumption websites are
_friendly_, which evidently they are not.

I hate smartphones, tablets and Microsoft Windows. I love UNIX and POSIX macOS for being the last lands of freedom. I don't want
every other process on my computer calling home every couple of minutes and transfering information I have no control over. On
UNIX I rely on the [AIT framework][ait], which also operates on macOS. On macOS I also rely on [Little Snitch][snitch] to control
all outgoing communications from any program or service.

### Rule groups

While Little Snitch is a great piece of software and does its job nicely, it is a real pain to manage and maintain you rules. The
purpose of this repository is to manage and maintain rule groups which can be easily subscribed to from within the application.

| List        | Subscription URL       | Purpose                                                                                 |
| ----------- | ---------------------- | --------------------------------------------------------------------------------------- |
| [Blacklist] | https://bit.ly/2BPsJ44 | Deny access to those numerous invasive services (ads, geolocation, analytics, …)        |
| [Whitelist] | https://bit.ly/2pYIW40 | Allow access to websites -- this is probably only usefull for me :smile:                |
|             |                        |                                                                                         |
| [AppStore]  | https://bit.ly/2pivdoS | MacOS services which you occasionally turn on to enable Apple Store and related         |
| [NoUpdate]  | https://bit.ly/2WhyXD6 | Lets me decide when applications are allowed to call home (e.g. for updates)            |
| [Services]  | https://bit.ly/2Pnm9K3 | Services which should not be calling home all the time (emulate no Internet state).     |

<!-- # Bookmarks -->

  [ait]:            https://github.com/ISLEcode/AIT
  [snitch]:         https://www.obdev.at

  [appstore]:       https://github.com/marcastel/snitch/wiki/Rules-AppStore
  [blacklist]:      https://github.com/marcastel/snitch/wiki/Rules-Blacklist
  [noupdate]:       https://github.com/marcastel/snitch/wiki/Rules-NoUpdate
  [services]:       https://github.com/marcastel/snitch/wiki/Rules-Services
  [whitelist]:      https://github.com/marcastel/snitch/wiki/Rules-Whitelist

<!-- vim: set spelllang=en :-->
