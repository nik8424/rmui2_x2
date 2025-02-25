LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

include $(CLEAR_VARS)
LOCAL_MODULE       := logcat.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/logcat.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.qcom.post_boot.sh
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := bin/init.qcom.post_boot.sh
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_EXECUTABLES)
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.qcom.early_boot.sh
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := bin/init.qcom.early_boot.sh
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_EXECUTABLES)
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.qcom.sensors.sh
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := bin/init.qcom.sensors.sh
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_EXECUTABLES)
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := fstab.qcom
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := etc/fstab.qcom
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.target.rc
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := etc/init.target.rc
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.qcom.rc
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := etc/init.qcom.rc
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.oppo.display.rc
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := etc/init.oppo.display.rc
# LOCAL_MODULE_PATH  := $(TARGET_OUT_ODM_ETC)/init/hw
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.oppo.rc
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := etc/init.oppo.rc
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.qcom.sh
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := bin/init.qcom.sh
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_EXECUTABLES)
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE        := init.class_main.sh
# LOCAL_MODULE_TAGS   := optional
# LOCAL_MODULE_CLASS  := ETC
# LOCAL_SRC_FILES     := bin/init.class_main.sh
# LOCAL_MODULE_PATH   := $(TARGET_OUT_VENDOR_EXECUTABLES)
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.qcom.factory.rc
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := etc/init.qcom.factory.rc
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.qcom.class_main.sh
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := bin/init.qcom.class_main.sh
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_EXECUTABLES)
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.qcom.usb.rc
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := etc/init.qcom.usb.rc
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE       := init.qcom.usb.sh
# LOCAL_MODULE_TAGS  := optional
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SRC_FILES    := bin/init.qcom.usb.sh
# LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_EXECUTABLES)
# include $(BUILD_PREBUILT)
