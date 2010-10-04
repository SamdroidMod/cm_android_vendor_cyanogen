# Inherit device configuration for Vibrant.
$(call inherit-product, device/samsung/spica/full_spica.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_spica
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := spica
PRODUCT_MODEL := GT-I5700
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_BOARD=GT-I5700 PRODUCT_DEVICE=GT-I5700 PRODUCT_NAME=GT-I5700 BUILD_ID=FRG83 BUILD_DISPLAY_ID=FRG83 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2.1/FRG83/60505:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.2.1 FRG83 60505 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-spica.map

# Use amend for otapackage
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_SCRIPT_MODE=amend

# Enable Windows Media
WITH_WINDOWS_MEDIA := true

# Extra Vibrant overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/spica

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6-$(shell date +%m%d%Y)-NIGHTLY-Spica
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6.1.0-RC0-Spica
endif

#
# Copy Vibrant specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGES += \
    LatinIME
