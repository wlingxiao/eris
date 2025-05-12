#!/usr/bin/bash
#shellcheck disable=SC2115

set ${SET_X:+-x} -eou pipefail

repos=(
    google-chrome
)

for repo in "${repos[@]}"; do
    if [[ -f "/etc/yum.repos.d/{$repo}.repo" ]]; then
        sed -i 's@enabled=1@enabled=0@g' "/etc/yum.repos.d/{$repo}.repo"
    fi
done

dnf5 clean all

# https://github.com/m2Giles/m2os/blob/main/build_files/cleanup.sh
rm -rf /tmp/*
rm -rf /var/*
rm -rf /boot/*
rm -rf /usr/etc
mkdir -p /tmp
mkdir -p /var/tmp
chmod -R 1777 /var/tmp
