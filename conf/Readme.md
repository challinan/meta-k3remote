To set up build:

This layer was developed on top of the kirkstone relese.

In local.conf:
  Set LOCAL_SSID to the name of the local Wifi node
  Set PSK_PASSWD to the password of the local wifi
  Set USER_NAME to the user account to be created
  Set USER_PASSWD to the password of the user account being created
  Set DISTRO = "k3distro"

# Add the following to squash rust*
SKIP_RECIPE[rust-cross] = "WE DONT WANT RUST - FAIL NOW"
SKIP_RECIPE[rust-llvm] = "SKIP"
SKIP_RECIPE[rust-native] = "SKIP"
