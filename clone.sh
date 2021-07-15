#!/bin/bash

MONGO_URI_SOURCE=$1
MONGO_URI_TARGET=$2
DB_NAME_SOURCE="${MONGO_URI_SOURCE##*/}"
DB_NAME_TARGET="${MONGO_URI_TARGET##*/}"

mongodump --uri="${MONGO_URI_SOURCE}" --forceTableScan --archive | mongorestore --uri="${MONGO_URI_TARGET}" --archive --nsInclude="${DB_NAME_SOURCE}.*" --nsFrom="${DB_NAME_SOURCE}.*" --nsTo="${DB_NAME_TARGET}.*" --drop