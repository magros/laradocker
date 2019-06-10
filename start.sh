#!/usr/bin/env bash
role=${CONTAINER_ROLE}

if [[ "$role" = "webapp" ]]; then
    service php7.2-fpm start
    nginx -g 'daemon off;'
elif [[ "$role" = "scheduler" ]]; then
    while [[ true ]]
    do
      php /var/www/html/artisan schedule:run --verbose --no-interaction &
      sleep 60
    done
else
    echo "Invalid container role $role"
    exit 1
fi
