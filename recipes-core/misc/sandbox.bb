SUMMARY = "Build my sandbox directory"
DESCRIPTION = "My own build setup and related tools"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

do_fetch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"

ALLOW_EMPTY:${PN} = "1"

FILES:${PN} = "/home/ /home/chris/ /home/chris/sandbox/"

do_install() {
    install -d ${D}/home
    install -d ${D}/home/chris
    install -d ${D}/home/chris/sandbox
}
