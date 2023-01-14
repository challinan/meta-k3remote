DESCRIPTION = "scripts and pre-compiled binaries used to create the rpi-eeprom package which is used to update the Raspberry Pi 4 bootloader and VLI USB controller EEPROMs"
HOMEPAGE = "https://github.com/raspberrypi/rpi-eeprom"
SECTION = "devel/libs"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = "git://github.com/raspberrypi/rpi-eeprom.git;branch=master;protocol=https \
	   "

S = "${WORKDIR}/git"

SRCREV = "6e79e995bbc75c5fdd5305bd7fe029758cfade2f"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

FILES_{$PN} = "${bindir}/*"

do_install() {
	install -d ${D}/bin/
	install -m 0755 ${WORKDIR}/git/rpi-eeprom-config ${D}/bin/rpi-eeprom-config
	install -m 0755 ${WORKDIR}/git/rpi-eeprom-digest ${D}/bin/rpi-eeprom-digest
	install -m 0755 ${WORKDIR}/git/rpi-eeprom-update ${D}/bin/rpi-eeprom-update
}
