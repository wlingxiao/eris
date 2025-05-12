#!/usr/bin/bash

set ${SET_X:+-x} -eou pipefail

# VSCode because it's still better for a lot of things
tee /etc/yum.repos.d/vscode.repo <<'EOF'
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

dnf5 install --setopt=install_weak_deps=False -y \
    code    

# https://aur.archlinux.org/cgit/aur.git/tree/rslsync_user.service?h=rslsync
sed -i 's@WantedBy=multi-user.target@WantedBy=default.target@g' "/usr/lib/systemd/user/resilio-sync.service"

/ctx/simplenote.sh
/ctx/google-chrome.sh
/ctx/resilio-sync.sh