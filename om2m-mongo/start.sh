#!/bin/bash
# Read environment variables
mongo_url=${MONGO_URL:-mongo-db:27017}
mongo_user=${MONGO_USER:-om2m}
mongo_password=${MONGO_PASSWORD:-om2m}
admin_user=${ADMIN_USER:-admin}
admin_password=${ADMIN_PASSWORD:-admin}

# Update config.ini file
sed -i "s/org.eclipse.om2m.dbUrl=.*/org.eclipse.om2m.dbUrl=$mongo_url/g" configuration/config.ini
sed -i "s/org.eclipse.om2m.dbUser=.*/org.eclipse.om2m.dbUser=$mongo_user/g" configuration/config.ini
sed -i "s/org.eclipse.om2m.dbPassword=.*/org.eclipse.om2m.dbPassword=$mongo_password/g" configuration/config.ini
sed -i "s/org.eclipse.om2m.adminRequestingEntity=.*/org.eclipse.om2m.adminRequestingEntity=$admin_user\\:$admin_password/g" configuration/config.ini

java -jar -ea -Declipse.ignoreApp=true -Dosgi.clean=true -Ddebug=true plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar -console -noExit
