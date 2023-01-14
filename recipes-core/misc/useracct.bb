# Copyright (C) 2023 Chris Hallinan <challinan@gmail.com>
# Released under the MIT license (see COPYING.MIT for the terms)

SUMMARY = "Add a user account"
HOMEPAGE = "None"
LICENSE = "MIT"
SECTION = "devel"

ALLOW_EMPTY:${PN} = "1"

do_fetch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"


inherit extrausers

EXTRA_USERS_PARAMS += "\
    useradd --shell /bin/bash chris; \
"
