#!/bin/sh

if [ -z "${HUGO_PUBLIC}" ]
then
    HUGO_PUBLIC="${HUGO_SITE}"/public
fi
mkdir -p "${HUGO_PUBLIC}"


default_cmd='hugo server --bind 0.0.0.0
        --navigateToChanged
        --templateMetrics
        --buildDrafts'

if [ "$1" = 'hugo' ]
then
    exec "$@"
elif [ $# -gt 0 ]
then
    exec hugo "$@"
else
    su "${HUGO_USER}" -c "exec ${default_cmd}"
fi
