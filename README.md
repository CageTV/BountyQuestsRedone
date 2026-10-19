# Bounty Quests Redone

* [Nexus Page](https://www.nexusmods.com/skyrimspecialedition/mods/100630)

### Requirements

* [XMake](https://xmake.io/) [2.7.8+]
* C++23 Compiler (MSVC)

## Build
```
xmake build
```

## Special Credits

[danielaparker](https://github.com/danielaparker) for [jsoncons](https://github.com/danielaparker/jsoncons).

[Qudix](https://github.com/Qudix) for [CommonLibSSE-NG Template Plugin](https://github.com/Qudix/template-commonlibsse-ng).

[CharmedBaryon](https://github.com/CharmedBaryon) and all the people who contributed to [CommonLibSSE-NG](https://github.com/CharmedBaryon/CommonLibSSE-NG).

Orrie for helping me with xedit scripts.

GhoulSmasher for beta testing the plugin.

## License
[MIT](LICENSE)

## Fork: Skyrim 1.7.x

The Color-Glass CommonLibSSE-NG that `xmake.lua` builds against cannot read the version 5 Address Library files of Skyrim 1.7.x. `ng.cmake` builds `Bounty Quests Redone.dll` on alandtse's CommonLibSSE-NG for Skyrim 1.6.1170 and 1.7.x; it is included from a parent CMake project that defines `ng_plugin()` (a thin wrapper around `add_commonlibsse_plugin`) and provides `jsoncons` through vcpkg. In that build `BQR_NG` is defined: the unused `WinAPI` namespace alias is left out and the gold reward message goes through `RE::SendHUDMessage::ShowHUDMessage` (`RE::DebugNotification` is gone from that library). The `interface` variable in `Main.cpp` was renamed because `interface` is a macro in the Windows headers.

The three engine functions the plugin calls (`TESQuest` GetStageDone, SetStage and GetLocation, Address Library ids 25011, 25004 and 25067) were checked against SkyrimSE.exe 1.7.104.

The release zip contains only the DLL. Install Bounty Quests Redone from Nexus first and let the DLL overwrite its own.
