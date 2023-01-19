FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# gstreamer1.0-plugins-bad drags in rust, cargo and rust-llvm, 
#   making the build HUGE!  We don't need those.

PACKAGECONFIG[gstreamer] = "-gstreamer 1.0,,gstreamer1.0 gstreamer1.0-plugins-base"


