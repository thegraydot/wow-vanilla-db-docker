#!/bin/bash


LATEST_FULL_DB="ClassicDB_1_12_1_z2815"

export MYSQL_PWD="$MYSQL_PASSWORD"
MYSQL_CMD="mysql -u$MYSQL_USER -D $MYSQL_DATABASE"

echo "[+] Running init_cmangos.sh"

cd /opt/classic-db/Full_DB


echo "[+] Extract latest world DB..."
gunzip -f "$LATEST_FULL_DB.sql.gz"

echo "[+] Inserting latest world DB..."
$MYSQL_CMD < "$LATEST_FULL_DB.sql"

echo "[+] Inserting latest DB updates..."
cd /opt/classic-db/Updates
for sql_file in *.sql; do
    echo "[+] Inserting: $sql_file"
    $MYSQL_CMD < "$sql_file"
done

echo "[+] Inserting latest DB migrations..."
cd /opt/mangos-classic/sql/updates/mangos
for sql_file in *.sql; do
    echo "[+] Inserting: $sql_file"
    $MYSQL_CMD < "$sql_file"
done
