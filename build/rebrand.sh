#!/bin/bash -e

main() {
    set_logo
    update_index
}

update_index() {
    local index=/opt/app-root/src/build/stable/index.html

    sed -i 's,Hybrid Cloud Console,Konflux,g' "$index"
    sed -i 's,type="image/png" href="https://access.redhat.com/webassets/avalon/g/favicon.ico",type="image/svg+xml" href="/apps/chrome/favicon.svg",g' "$index"
}

set_logo() {
    local existing_logo
    existing_logo="$(grep -l Red_hat /opt/app-root/src/build/stable/js/*.svg)"

    mv logo.svg "$existing_logo"
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    main "$@"
fi
