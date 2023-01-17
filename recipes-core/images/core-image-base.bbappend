# Our K3 Image

#    This was in RDEPENDS
#    packagegroup-core-standalone-sdk-target
#    qtbase-dev

# Add this package to the SDK
TOOLCHAIN_HOST_TASK:append = " nativesdk-packagegroup-qt5-toolchain-host"

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
"

# tools-debug - adds debugging tools like gdb and strace.
EXTRA_IMAGE_FEATURES += "\
    tools-debug \
"

# gstreamer1.0-plugins-bad drags in rust, cargo and rust-llvm, making the build HUGE!
IMAGE_INSTALL:append = " \
  packagegroup-core-ssh-openssh \
  qtchooser \
  cmake \
  sudo \
  ntp \
  tree \
  libpam \
  samba \
  rpi-eeprom \
  qtbase \
  qtbase-dev \
  gstreamer1.0 \
  gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good \
  gstreamer1.0-rtsp-server \
"

# System setup and utilities
IMAGE_INSTALL:append = " sandbox"

