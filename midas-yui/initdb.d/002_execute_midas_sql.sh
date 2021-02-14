
mysql -u ${DB_MIDAS_ROOT_USER} -p${DB_MIDAS_ROOT_PASS} ${DB_DATABASE_NAME} < /docker-entrypoint-initdb.d/midas_sql/*.sql
