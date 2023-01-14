FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_install:append() {
    echo "[sandbox-pik3]" >> ${D}${sysconfdir}/samba/smb.conf
    echo "   comment = Working directory" >>${D}${sysconfdir}/samba/smb.conf
    echo "   path = /home/chris/sandbox" >>${D}${sysconfdir}/samba/smb.conf
    echo "   browsable = yes" >> ${D}${sysconfdir}/samba/smb.conf
    echo "   guest ok = yes" >> ${D}${sysconfdir}/samba/smb.conf
    echo "   read only = no" >> ${D}${sysconfdir}/samba/smb.conf

    install -d ${D}${sysconfdir}/pam.d
    echo "auth	include common-auth" >${D}${sysconfdir}/pam.d/samba
    echo "account	include common-account" >> ${D}${sysconfdir}/pam.d/samba
    echo "session include common-session-noninteractive" >>${D}${sysconfdir}/pam.d/samba
}


