#!/bin/bash

set -x

docker exec -u www-data nextcloud-app php occ maintenance:install -n --admin-user "$NEXTCLOUD_ADMIN_USER" --admin-pass "$NEXTCLOUD_ADMIN_PASSWORD" \
  --database mysql --database-name "$MYSQL_DATABASE" --database-user "$MYSQL_USER" --database-pass "$MYSQL_PASSWORD" --database-host "$MYSQL_HOST"

docker exec -u www-data nextcloud-app php occ --no-warnings config:system:get trusted_domains >> trusted_domain.tmp

if ! grep -q "nginx-server" trusted_domain.tmp; then
    TRUSTED_INDEX=$(cat trusted_domain.tmp | wc -l);
    docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set trusted_domains $TRUSTED_INDEX --value="nginx-server"
fi

rm trusted_domain.tmp

docker exec -u www-data nextcloud-app php occ --no-warnings app:install onlyoffice

docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/ds-vpath/"
docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://onlyoffice-app/"
docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://nginx-server/"
