# Our K3 Image

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# LICENSE = "GPL-2.0-only"

# LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI += " \
	file://wpa_supplicant_local.conf \
"

do_install:append() {
    # Substitute the local SSID and PSK password values in our local conf file
    # These values must be supplied in local.conf so they don't show up in any public repo!
    if [ -z ${LOCAL_SSID} ]; then
        bbfatal "SSID not set in local.conf.  See layer Readme.md"
    fi

    if [ -z ${PSK_PASSWD} ]; then
        bbfatal "PSK not set in local.conf.  See layer Readme.md"
    fi

    sed -i -e 's@SSIDVAL@"${LOCAL_SSID}"@g' ${WORKDIR}/wpa_supplicant_local.conf
    sed -i -e 's@PSKVAL@"${PSK_PASSWD}"@g' ${WORKDIR}/wpa_supplicant_local.conf

    install -d ${D}/etc/
    install -m 0600 ${WORKDIR}/wpa_supplicant_local.conf ${D}/etc/wpa_supplicant.conf
    install -m 0600 ${WORKDIR}/wpa_supplicant_local.conf ${D}/etc/wpa_supplicant-wlan0.conf
}
