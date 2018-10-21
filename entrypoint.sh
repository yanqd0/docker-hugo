#!/bin/sh

if [ "$1" = 'hugo' ]
then
    exec "$@"
elif [ "$1" = 'sh' ]
then
    exec 'sh'
elif [ "$1" = 'ash' ]
then
    exec 'ash'
elif [ $# -gt 0 ]
then
    exec hugo "$@"
else
    su "${HUGO_USER}" -c 'hugo server --bind 0.0.0.0 --navigateToChanged --templateMetrics --buildDrafts'
fi
