#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from X2 device
$(call inherit-product, device/realme/X2/device.mk)

#UDFPS
TARGET_HAS_UDFPS := true
EXTRA_UDFPS_ANIMATIONS := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_ENABLE_BLUR := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_QUICK_TAP  := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_X2
PRODUCT_DEVICE := X2
PRODUCT_BRAND := realme
PRODUCT_MODEL := realme X2
PRODUCT_MANUFACTURER := realme

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="RMX1993L1-user 11 RKQ1.201112.002 1639416071279 release-keys" \
    DeviceName=X2 \
    DeviceProduct=X2 \
    SystemDevice=X2 \
    SystemName=X2

BUILD_FINGERPRINT := "google/husky/husky:14/UQ1A.240205.004.B1/11318806:user/release-keys"

# PRODUCT_GMS_CLIENTID_BASE := android-oppo

# Build type GMS
WITH_GMS := true
PRODUCT_GMS_CLIENTID_BASE := android-realme

# Lunch banner maintainer variable
RISING_MAINTAINER="linux.xd"

# Wether to ship lawnchair launcher
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true

# RisingOS Flags
PRODUCT_NO_CAMERA := false
TARGET_DEFAULT_PIXEL_LAUNCHER := true
TARGET_ENABLE_PIXEL_FEATURES := true
TARGET_PREBUILT_GOOGLE_CAMERA := false
