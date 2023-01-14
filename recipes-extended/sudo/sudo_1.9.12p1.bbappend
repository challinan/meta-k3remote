CONFFILES:${PN}-lib += "${D}${sysconfdir}/sudoers.d/chris"

do_install:append() {
	echo "chris ALL=(ALL:ALL) ALL" >${D}${sysconfdir}/sudoers.d/chris
}
