#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="gta4l"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   	export OF_SCREEN_H=2400
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1

    export FOX_VERSION="R11.1_A0"
    export FOX_BUILD_TYPE=Alpha
    # export FOX_ENABLE_LAB=1
    
    export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
    export ALLOW_MISSING_DEPENDENCIES=true
    export OF_AB_DEVICE=1
    export OF_USE_MAGISKBOOT=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

    export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
    export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0

    export FOX_USE_NANO_EDITOR=1
    export FOX_USE_BASH_SHELL=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_XZ_UTILS=1

    export FOX_ADVANCED_SECURITY=1

    # Temp
    export OF_NO_SPLASH_CHANGE=1

    export OF_QUICK_BACKUP_LIST="/data;/super;"
    export TARGET_DEVICE_ALT="gta4l"

    export FOX_REMOVE_AAPT=1
    export FOX_DISABLE_APP_MANAGER=1
    export FOX_DELETE_AROMAFM=1

    export OF_STATUS_INDENT_LEFT=64
    export OF_STATUS_INDENT_RIGHT=64

    export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00

    export OF_MAINTAINER="1"
     
    # Screen Resolution - 2000x1200
    export OF_SCREEN_H=1800

    # whether to permit free access to internal storage
	if [ "$FOX_VARIANT" = "strict" ]; then
    export OF_FORCE_CREATE_DATA_MEDIA_ON_FORMAT=0
    export OF_RUN_POST_FORMAT_PROCESS=1
	else
    export OF_FORCE_CREATE_DATA_MEDIA_ON_FORMAT=1
	fi
 
    export FOX_BOARD_AVB_ENABLE=1
    export AVBTOOL=external/avb
    
    export OF_KEEP_FORCED_ENCRYPTION="1"
    
    # Create Odin Flashable .tar files
    export OF_NO_SAMSUNG_SPECIAL=0
