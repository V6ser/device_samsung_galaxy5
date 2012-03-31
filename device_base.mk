# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/galaxy5/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/galaxy5/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Live wallpaper packages
PRODUCT_PACKAGES += \
    make_ext4fs \
    brcm_patchram_plus \
    g5sensord \
    lights.galaxy5 \
    copybit.galaxy5 \
    gralloc.galaxy5 \
    sensors.galaxy5 \
    hwcomposer.default \
    bdaddr_read \
    setup_fs \
    dexpreopt \
    dump_image \
    e2fsck \
    erase_image \
    flash_image \
    screencap

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/vold.fstab:system/etc/vold.fstab

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/ueventd.gt-i5500.rc:root/ueventd.gt-i5500.rc \
    device/samsung/galaxy5/default.prop:root/default.prop \
    device/samsung/galaxy5/prebuilt/acc_cal_param.ko:root/lib/modules/acc_cal_param.ko \
    device/samsung/galaxy5/prebuilt/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/galaxy5/prebuilt/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/galaxy5/prebuilt/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/galaxy5/prebuilt/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/galaxy5/prebuilt/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/galaxy5/EUROPA.rle:root/EUROPA.rle \
    device/samsung/galaxy5/init.gt-i5500.rc:root/init.gt-i5500.rc

## wifi module
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/galaxy5/prebuilt/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/galaxy5/prebuilt/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/galaxy5/prebuilt/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/galaxy5/prebuilt/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/galaxy5/prebuilt/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/samsung/galaxy5/prebuilt/hostapd:system/bin/hostapd \
    device/samsung/galaxy5/prebuilt/wlan_tool:system/bin/wlan_tool \
    device/samsung/galaxy5/prebuilt/wmiconfig:system/bin/wmiconfig 

## Wifi Stuff
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/galaxy5/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/galaxy5/prebuilt/dhcpcd.conf:system/etc/wifi/dhcpcd.conf \
    device/samsung/galaxy5/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

## Media
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/audio.primary.galaxy5.so:system/lib/hw/audio.primary.galaxy5.so\
    device/samsung/galaxy5/prebuilt/audio_policy.galaxy5.so:system/lib/hw/audio_policy.galaxy5.so\
    device/samsung/galaxy5/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/galaxy5/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/galaxy5/prebuilt/audio_effects.conf:system/etc/audio_effects.conf \
    device/samsung/galaxy5/prebuilt/apns-conf.xml:system/etc/apns-conf.xml \
    device/samsung/galaxy5/prebuilt/hosts:system/etc/hosts \
    device/samsung/galaxy5/prebuilt/sysctl.conf:system/etc/sysctl.conf \
    device/samsung/galaxy5/prebuilt/media_profiles.xml:system/etc/media_profiles.xml 

## keymap
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/galaxy5/prebuilt/europa_keypad0.kl:system/usr/keylayout/europa_keypad0.kl \
    device/samsung/galaxy5/prebuilt/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/galaxy5/prebuilt/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/galaxy5/prebuilt/europa_headset.kl:system/usr/keylayout/europa_headset.kl 

## keychar
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/qwerty.kcm.bin:system/usr/keylayout/qwerty.kcm \
    device/samsung/galaxy5/prebuilt/qwerty2.kcm.bin:system/usr/keylayout/qwerty2.kcm \
    device/samsung/galaxy5/prebuilt/europa_keypad0.kcm.bin:system/usr/keylayout/europa_keypad0.kcm

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

## Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd:system/etc/firmware/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd

## Sensors
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/qmuxd:system/bin/qmuxd

## 3D
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/galaxy5/prebuilt/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/samsung/galaxy5/prebuilt/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/galaxy5/prebuilt/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/galaxy5/prebuilt/libgsl.so:system/lib/libgsl.so \
    device/samsung/galaxy5/prebuilt/egl.cfg:system/lib/egl/egl.cfg 

## GPU firmware
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/samsung/galaxy5/prebuilt/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw

## other media
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/get_macaddrs:system/bin/get_macaddrs \
    device/samsung/galaxy5/prebuilt/run_drm:system/bin/run_drm

## ril
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/libdiag.so:system/lib/libdiag.so \
    device/samsung/galaxy5/prebuilt/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/galaxy5/prebuilt/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/galaxy5/prebuilt/libril.so:system/lib/libril.so 

## script
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/01sysctl:system/etc/init.d/01sysctl \
    device/samsung/galaxy5/prebuilt/04modules:system/etc/init.d/04modules \
    device/samsung/galaxy5/prebuilt/20userinit:system/etc/init.d/20userinit \
    device/samsung/galaxy5/prebuilt/99complete:system/etc/init.d/99complete 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \

# LDPI assets
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
$(call inherit-product, build/target/product/full_base.mk)
