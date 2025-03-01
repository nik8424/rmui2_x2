#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit some common Derp stuff.
$(call inherit-product, vendor/derp/config/common_full_phone.mk)

# Inherit from X2 device
$(call inherit-product, device/realme/X2/device.mk)

#UDFPS
TARGET_HAS_UDFPS := true
EXTRA_UDFPS_ANIMATIONS := true
TARGET_FACE_UNLOCK_SUPPORTED := true
#TARGET_ENABLE_BLUR := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_QUICK_TAP  := true
TARGET_BOOT_ANIMATION_RES := 1080

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := derp_X2
PRODUCT_DEVICE := X2
PRODUCT_BRAND := realme
PRODUCT_MODEL := realme X2
PRODUCT_MANUFACTURER := realme

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="RMX1993L1-user 11 RKQ1.201112.002 1639416071279 release-keys"

BUILD_FINGERPRINT := "google/husky/husky:14/UQ1A.240205.004.B1/11318806:user/release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-oppo

# Build type
# DERP_BUILDTYPE := Official
# DERP_BUILD_ZIP_TYPE := VANILLA
# TARGET_USES_PICO_GAPPS = true
# TARGET_INCLUDE_STOCK_ARCORE := true
# TARGET_SUPPORTS_CALL_RECORDING := true
