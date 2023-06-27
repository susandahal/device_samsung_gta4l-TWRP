#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from gta4l device
$(call inherit-product, device/samsung/gta4l/device.mk)

PRODUCT_DEVICE := gta4l
PRODUCT_NAME := twrp_gta4l
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T505
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gta4lxx-user 11 RP1A.200720.012 T505XXU4CWA1 release-keys"

BUILD_FINGERPRINT := samsung/gta4lxx/gta4l:11/RP1A.200720.012/T505XXU4CWA1:user/release-keys
