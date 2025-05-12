#!/usr/bin/bash
#shellcheck disable=SC2115

set ${SET_X:+-x} -eou pipefail

repos=(
    google-chrome
    vscode
    resilio-sync
)

for repo in "${repos[@]}"; do
    if [[ -f "/etc/yum.repos.d/{$repo}.repo" ]]; then
        sed -i 's@enabled=1@enabled=0@g' "/etc/yum.repos.d/{$repo}.repo"
    fi
done

dnf5 clean all
