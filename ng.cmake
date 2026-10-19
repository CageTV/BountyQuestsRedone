# "Bounty Quests Redone.dll" on alandtse's CommonLibSSE-NG (Skyrim 1.6.1170 and 1.7.x, SE and AE); included by E:/WorkSpace/ng-build/CMakeLists.txt (see ng_plugin there).
# The repository's own xmake.lua builds against the Color-Glass CommonLibSSE-NG, whose Address Library reader cannot open the version 5 files of Skyrim 1.7.x.
# jsoncons comes from vcpkg through the parent project.
file(READ "${CMAKE_CURRENT_LIST_DIR}/xmake.lua" _bqr_xmake)
if(NOT _bqr_xmake MATCHES "set_version[(]\"([0-9]+[.][0-9]+[.][0-9]+)\"[)]")
    message(FATAL_ERROR "Bounty Quests Redone ng.cmake: no set_version(\"x.y.z\") in xmake.lua")
endif()
find_package(jsoncons CONFIG REQUIRED)
ng_plugin(TARGET BountyQuestsRedone NAME "Bounty Quests Redone" VERSION ${CMAKE_MATCH_1} AUTHOR "digital-apple" ROOT "${CMAKE_CURRENT_LIST_DIR}"
    SOURCES source/Events.cpp source/Main.cpp source/Papyrus.cpp source/System.cpp
    INCLUDES "${CMAKE_CURRENT_LIST_DIR}/include" "${CMAKE_CURRENT_LIST_DIR}/source"
    PCH "${CMAKE_CURRENT_LIST_DIR}/include/PCH.h"
    DEFINES BQR_NG
    LIBS jsoncons::jsoncons)
