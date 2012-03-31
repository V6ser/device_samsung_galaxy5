## Specify phone tech before including full_phone
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/aokp/configs/common_full_phone.mk)

# Inherit some common google stuff.
# $(call inherit-product, vendor/google/gapps.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/galaxy5/full_galaxy5.mk)

PRODUCT_NAME := aokp_galaxy5

# Release name and versioning
PRODUCT_RELEASE_NAME := GalaxyEuropa
PRODUCT_VERSION_DEVICE_SPECIFIC := -GT-I5500
-include vendor/aokp/configs/common_versions.mk

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := galaxy5
