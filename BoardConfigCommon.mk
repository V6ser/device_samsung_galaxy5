# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

TARGET_GLOBAL_CFLAGS += -mfpu=vfp -mfloat-abi=softfp -Os
TARGET_GLOBAL_CPPFLAGS += -mfpu=vfp -mfloat-abi=softfp -Os

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
# for now
USE_CAMERA_STUB := false

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/galaxy5/recovery_kernel
TARGET_RECOVERY_INITRC := device/samsung/galaxy5/recovery.rc
TARGET_BOARD_PLATFORM := msm7x27
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi

BOARD_USES_QCOM_HARDWARE := false
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_LEGACY := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := galaxy5
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

#BOARD_CUSTOM_USB_CONTROLLER := ../../device/samsung/galaxy5/UsbController.cpp

TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := galaxy5

# assert
TARGET_OTA_ASSERT_DEVICE := galaxy5,GT-I5500

#BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
#BOARD_FM_DEVICE := brcm2049
#HAS_BCM20780 := true
#BOARD_GLOBAL_CFLAGS += -DHAS_BCM20780

# Wifi related defines
PRODUCT_WIRELESS_TOOLS      := true
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := ar6000
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := ar6000
BOARD_WEXT_NO_COMBO_SCAN    := true

WITH_JIT := false
JS_ENGINE := v8
HTTP := chrome

TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
TARGET_PROVIDES_INIT_TARGET_RC := true

# OpenGL drivers config file path
BOARD_EGL_CFG := device/samsung/galaxy5/prebuilt/egl.cfg

BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
#TARGET_OVERLAY_ALWAYS_DETERMINES_FORMAT := true
#TARGET_USE_SOFTWARE_AUDIO_AAC := true
#BOARD_FORCE_STATIC_A2DP := true
#BOARD_USE_SCREENCAP := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
TARGET_DO_NOT_SETS_CAN_DRAW := true
TARGET_SF_NEEDS_REAL_DIMENSIONS := true
BOARD_NO_RGBX_8888 := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true

BOARD_MOBILEDATA_INTERFACE_NAME = "pdp0"

BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_PROVIDES_LIBAUDIO := true

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/vold/179:1
BOARD_SDEXT_DEVICE := /dev/block/vold/179:2
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH  := "/sys/devices/platform/usb_mass_storage/lun0/file"
#DISABLE_DEXPREOPT := true
BOARD_NO_PAGE_FLIPPING := true
#USE_OPENGL_RENDERER := false
BOARD_NO_PAGE_FLIPPING := true
COPYBIT_MSM7K := true
BOARD_USE_LEGACY_TOUCHSCREEN := true
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27 -DNO_RGBX_8888 #-DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_GRALLOC_BUFFERS
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_PIXEL_FORMAT_YV12
COMMON_GLOBAL_CFLAGS += -DBOARD_GL_OES_EGL_IMG_EXTERNAL_HACK
COMMON_GLOBAL_CFLAGS += -D_INTERNAL_BINDER_PARCEL_ -DUSE_LGE_ALS_DUMMY

# Recovery
BOARD_NAND_PAGE_SIZE := 4096 -s 128
BOARD_PAGE_SIZE := 0x00001000
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 186122240
BOARD_USERDATAIMAGE_PARTITION_SIZE := 203161600
BOARD_FLASH_BLOCK_SIZE             := 4096
BOARD_KERNEL_CMDLINE := 
BOARD_BML_BOOT                     := "/dev/block/bml9"
BOARD_BML_RECOVERY                 := "/dev/block/bml10"

BOARD_LDPI_RECOVERY := true
BOARD_RECOVERY_HANDLES_MOUNT       := true
#BOARD_CUSTOM_RECOVERY_KEYMAPPING   := ../../device/samsung/galaxy5/recovery/recovery_ui.c
BOARD_CUSTOM_GRAPHICS              := ../../../device/samsung/galaxy5/recovery/graphics.c
