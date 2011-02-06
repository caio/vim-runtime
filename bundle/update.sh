#!/bin/bash

# exit on any errors
set -e

# true|false
verbose=false

log() {
    echo ">>> ${@}"
}

run() {
    $verbose && ${@} || (${@} 2>&1 >/dev/null) 2>&1 >/dev/null
}

log "Checking-out master for each bundle"
run git submodule foreach git checkout master
log "Updating each bundle"
run git submodule foreach git pull

updates=0
git status --porcelain | grep bundle| grep M|cut -d/ -f 2|
grep -v update.sh| while read BUNDLE; do
    updates=$((updates + 1))
    log "Adding updated ${BUNDLE} version"
    run git add bundle/${BUNDLE}
    git commit -m "Update ${BUNDLE} plugin"
done

[ "${updates}" == "0" ] && log "Nothing done" || log "${updates} updated plugins"
