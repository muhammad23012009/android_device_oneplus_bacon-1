#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
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

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    camera.msm8974

# Display
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \

# Ubuntu Touch specific vars.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ubuntu/ofono.override:system/halium/etc/init/ofono.override \
    $(LOCAL_PATH)/ubuntu/70-android.rules:system/halium/lib/udev/rules.d/70-android.rules \
    $(LOCAL_PATH)/ubuntu/display.conf:system/halium/etc/ubuntu-touch-session.d/android.conf \
    $(LOCAL_PATH)/ubuntu/init_hcismd_up.sh:system/etc/init_hcismd_up.sh \
    $(LOCAL_PATH)/ubuntu/device-hacks.conf:system/halium/etc/init/device-hacks.conf \
    $(LOCAL_PATH)/ubuntu/usensord.conf:system/halium/usr/share/upstart/sessions/usensord.conf \
    $(LOCAL_PATH)/ubuntu/config-default.xml:system/halium/usr/share/repowerd/config-default.xml \
    $(LOCAL_PATH)/ubuntu/biometryd.conf:system/halium/etc/init/biometryd.conf

# Additional Android stuff for Ubuntu Touch
PRODUCT_PACKAGES += \
    libmedia_compat \
    minimediaservice \
    libaudioflingerglue \
    libminisf \
    miniafservice

# Disable fake sensor service
MINIMEDIA_SENSORSERVER_DISABLE := 1

# Some overrides from default settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.t-o.quirk.forcesink=sink.primary \
    ro.t-o.quirk.forcesource=source.primary \
    ro.ubuntu.camera_plugin=aal

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.bacon \
    init.bacon.rc \
    init.qcom.usb.rc \
    init.recovery.bacon.rc \
    ueventd.bacon.rc

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2016-09-01

# Call the proprietary setup
$(call inherit-product, vendor/oneplus/bacon/bacon-vendor.mk)

# Inherit from msm8974-common
$(call inherit-product, device/oppo/msm8974-common/msm8974.mk)
