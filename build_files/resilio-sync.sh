#!/usr/bin/bash

set ${SET_X:+-x} -eou pipefail

# Resilio Sync
# https://help.resilio.com/hc/en-us/articles/206178924-Installing-Sync-package-on-Linux
tee /etc/yum.repos.d/resilio-sync.repo <<'EOF'
[resilio-sync]
name=Resilio Sync
baseurl=https://linux-packages.resilio.com/resilio-sync/rpm/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://linux-packages.resilio.com/resilio-sync/key.asc
EOF

dnf5 install --setopt=install_weak_deps=False -y resilio-sync

sed -i 's@enabled=1@enabled=0@g' "/etc/yum.repos.d/resilio-sync.repo"

# https://aur.archlinux.org/cgit/aur.git/tree/rslsync_user.service?h=rslsync
sed -i 's@WantedBy=multi-user.target@WantedBy=default.target@g' "/usr/lib/systemd/user/resilio-sync.service"
