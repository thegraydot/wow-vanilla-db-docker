#!/bin/bash


echo "[+] Running init_cmangos.sh script..."

# Set working directory
cd /opt/classic-db/

echo "[+] Configuring InstallFullDB.sh script..."

# Overwrite defaults
sed -i "s|^CORE_PATH_DEFAULT=.*|CORE_PATH_DEFAULT=\"/opt/mangos-classic/\"|g" InstallFullDB.sh

sed -i "s|^AHBOT_DEFAULT=.*|AHBOT_DEFAULT=\"YES\"|g" InstallFullDB.sh

sed -i "s|^PLAYERBOTS_DB_DEFAULT=.*|PLAYERBOTS_DB_DEFAULT=\"YES\"|g" InstallFullDB.sh

sed -i "s|^MYSQL_USERNAME_DEFAULT=.*|MYSQL_USERNAME_DEFAULT=\"${MYSQL_USER}\"|g" InstallFullDB.sh

sed -i "s|^MYSQL_PASSWORD_DEFAULT=.*|MYSQL_PASSWORD_DEFAULT=\"${MYSQL_PASSWORD}\"|g" InstallFullDB.sh

# Run the InstallFullDB.sh script
echo "[+] Running InstallFullDB.sh script..."

bash InstallFullDB.sh -InstallAll root "$MYSQL_ROOT_PASSWORD" DeleteAll
