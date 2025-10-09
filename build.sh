#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 install -y --setopt=install_weak_deps=False \
    gcc-c++ \
    cmake \
    meson \
    ninja-build \
    wayland-devel \
    libxkbcommon-devel \
    pango-devel \
    scdoc \
    dnf-plugins-core

dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable luisbocanegra/kde-material-you-colors

dnf5 install -y --setopt=install_weak_deps=True \
    matugen \
    kde-material-you-colors

systemctl enable podman.socket
