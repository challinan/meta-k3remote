# Enable wlan0 on boot

do_install:append() {
	sed -i -e '/^# Wireless interfaces.*/a auto wlan0' ${D}${sysconfdir}/network/interfaces
}
