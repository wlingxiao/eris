#!/usr/bin/bash

set ${SET_X:+-x} -eou pipefail

/ctx/code.sh
/ctx/simplenote.sh
/ctx/google-chrome.sh
# /ctx/resilio-sync.sh
