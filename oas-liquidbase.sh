#!/bin/sh

# ------------------------------------------------------------------------
# Elaborado por:  Juan Orjuela - Ingeniero de Desarrollo                  |
# E-mail:         j.j.o.c007@gmail.com                                    |
# Fecha:          2016-06-17                                              |
# Descripcion:    Este script permite realizar las operaciones            |
#                 basicas de Liquibase                                    |
# ------------------------------------------------------------------------

WORK_DIR=/var/liquidbase-oas
cd $WORK_DIR

JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8"
LQBS_DIR=/var/liquibase/
OUTPUT_DIR=/var/liquidbase/logs

DRIVER=org.postgresql.Driver
CLASSPATH=$LQBS_DIR/lib/postgresql-9.2-1002.jdbc4.jar
URL=jdbc:postgresql://localhost:5432/OAS-API
CHANGELOGFILE=changelog-master.xml
LOGGIN=info

USERNAME=postgres
PASSWORD=123456


java -jar $LQBS_DIR/liquibase.jar --driver=$DRIVER --classpath=$CLASSPATH --url=$URL \
  --username=$USERNAME --password=$PASSWORD --changeLogFile=$CHANGELOGFILE --logLevel=$LOGGIN update
