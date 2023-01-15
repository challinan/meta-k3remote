# Our K3 Image
#    This was in RDEPENDS
#    packagegroup-core-standalone-sdk-target
#    qtbase-dev

# We don't need ext3 for Raspberry Pi
IMAGE_FSTYPES:remove = "ext3"

inherit extrausers
EXTRA_USERS_PARAMS = "\
    useradd --shell /bin/bash ${USER_NAME}; \
"

process_shadow_pw() {
    echo "Squash the password for our user account..."
    sed -i -e "s|${USER_NAME}:\!|${USER_NAME}:|g" ${IMAGE_ROOTFS}/etc/shadow
}

ROOTFS_POSTPROCESS_COMMAND:append = " \
    process_shadow_pw; \
"
#  sed -i 's/*/x/'
#  ${IMAGE_ROOTFS}/etc/passwd ;


RDEPENDS:qtbase += " \
    qtbase-mkspecs \
    qtbase-plugins \
    qtbase-staticdev \
    qtbase-tools \
    qtconnectivity-dev \
    qtconnectivity-mkspecs \
    qtserialport-dev \
    qtserialport-mkspecs \
    qttools-dev \
    qttools-mkspecs \
    qttools-staticdev \
    qttools-tools \
    qtquickcontrols2 \
    qtquickcontrols2-dev \
    qtquickcontrols2-mkspecs \
"

# tools-debug - adds debugging tools like gdb and strace.
EXTRA_IMAGE_FEATURES += "\
    tools-debug \
"

IMAGE_INSTALL:append = " \
  packagegroup-core-ssh-openssh \
  cmake \
  sudo \
  ntp \
  libpam \
  samba \
  rpi-eeprom \
  qtbase \
  qtbase-dev \
  gstreamer1.0 \
  gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-bad \
  gstreamer1.0-rtsp-server \
"

# System setup and utilities
IMAGE_INSTALL:append = " sandbox"

