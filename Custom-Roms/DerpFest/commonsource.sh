#!/bin/bash

# Detail Versions

path=/mnt/raghu/jenkins/workspace/DerpFest

# credentials

Telegram_Api_code=$(cat $path/cred** | grep api | cut -d "=" -f 2)
chat_id=$(cat $path/cred** | grep id | cut -d "=" -f 2)
password=$(cat $path/cred** | grep sf | cut -d "=" -f 2)
gitpassword=$(cat $path/cred** | grep git | cut -d "=" -f 2)


# Init Methods

COMMON-SOURCE()
{
    cd $path
    rm -r keys
    rm -r telegram.py
    rm -r derp.jpg
    rm -r changelog.txt
    rm -r json
    rm -r prebuilts
    git clone https://$gitpassword@github.com/RaghuVarma331/Keys keys
    wget  https://github.com/RaghuVarma331/scripts/raw/master/pythonscripts/telegram.py
    wget https://github.com/RaghuVarma331/custom_roms_banners/raw/master/derp.jpg
    wget https://raw.githubusercontent.com/RaghuVarma331/changelogs/master/crossdevelopment/changelog.txt
    git clone https://$gitpassword@github.com/RaghuVarma331/Json-Tracker.git json
    git clone https://github.com/RaghuVarma331/prebuilt_kernels.git -b ten prebuilts  
    cd derp
    rm -r device/nokia
    rm -r packages/apps/Gallery2
    rm -r vendor/gapps
    rm -r packages/apps/Settings
    rm -r packages/apps/OpenDelta  
    git clone https://github.com/RaghuVarma331/android_kernel_nokia_sdm660.git -b ten-gcc --depth=1 kernel/nokia/sdm660
    git clone https://github.com/RaghuVarma331/android_vendor_nokia.git -b ten vendor/nokia
    git clone https://github.com/RaghuVarma331/vendor_nokia_Camera.git -b ten --depth=1 vendor/nokia/Camera
    git clone https://gitlab.com/RaghuVarma331/vendor_gapps.git -b ten --depth=1 vendor/gapps
    git clone https://github.com/RaghuVarma331/android_packages_apps_Gallery2.git -b lineage-17.1 packages/apps/Gallery2
    git clone https://github.com/RaghuVarma331/Os_Updates.git -b pixel-ten packages/apps/Os_Updates          
    git clone https://github.com/LineageOS/android_packages_resources_devicesettings.git -b lineage-17.1 packages/resources/devicesettings
    git clone https://github.com/DerpLab/platform_packages_apps_Settings.git -b ten packages/apps/Settings    
    cd packages/apps/Settings    
    git remote add main https://github.com/RaghuVarma331/settings.git
    git fetch main
    git cherry-pick 7e115712a20e3494a54cacc4ec71b982158e2af1
    git cherry-pick f997d458211f0f7a9c1d58be43b7a08327785287
    cd src/com/android/settings/system
    rm -r SystemUpdatePreferenceController.java
    wget https://raw.githubusercontent.com/RaghuVarma331/settings/ten/src/com/android/settings/system/SystemUpdatePreferenceController.java
    cd
    cd $path/derp    
}  &> /dev/null


echo Setting up Common source..!!
COMMON-SOURCE
