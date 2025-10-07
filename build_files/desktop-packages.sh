#!/usr/bin/bash

set ${SET_X:+-x} -eou pipefail

dnf downgrade mt7xxx-firmware-20250311-1.fc42

/ctx/code.sh
/ctx/simplenote.sh
/ctx/google-chrome.sh
/ctx/resilio-sync.sh
