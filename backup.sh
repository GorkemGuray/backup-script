#!/bin/bash
############################################
# LICENCE : MIT                            #
# Copyright (c) 2018, Gorkem Guray         #
############################################


################ ATTENTION #################
# THIS SCRIPT REQUIRES GDRIVE              #
# https://github.com/prasmussen/gdrive     #
############################################


# Path for tar, mysqldump, zip and gdrive commands
export PATH="/bin:/usr/bin:/usr/local/go/bin/"

########## CHANGE BY YOURSELF ##########
########################################

# name prefix for backup
NAME='name_prefix'

# From which folder will the files be backed up?
# Don't use the "/"" at the end of line
FROM_BACKUP_DIR='/path/for/from/backup/folder'

# Which folder will the files be backed up to?
# Don't use the "/"" at the end of line
TO_BACKUP_DIR='/path/for/to/backup/folder'

# Google Drive Directory ID to upload
GOOGLE_DRIVE_DIR='Directory ID'

### FOR DB BACK-UP ###
# Database user
DBUSER='db_user'
# Database password
DBPASS='password'
# Database name
DBNAME='db_name'

########## END CHANGE BY YOURSELF ##########
############################################

# Data prefix for backup files
today=$(date +%d_%m_%Y)

# Compress the site files
tar -C ${FROM_BACKUP_DIR}/ -zcvf ${TO_BACKUP_DIR}/${NAME}-files_${today}.tar.gz .
# Backs up the database, compresses it, and deletes the uncompressed one
mysqldump -u ${DBUSER} -p${DBPASS} ${DBNAME} > ${TO_BACKUP_DIR}/${NAME}-db_${today}.sql
zip -r -j ${TO_BACKUP_DIR}/${NAME}-db_${today}.sql.zip ${TO_BACKUP_DIR}/${NAME}-db_${today}.sql
rm -f ${TO_BACKUP_DIR}/${NAME}-db_${today}.sql 
# Uploads backup files to google drive.
gdrive sync upload --delete-extraneous ${TO_BACKUP_DIR}/ ${GOOGLE_DRIVE_DIR}
# Delete the backup files that are also on the server
rm -f ${TO_BACKUP_DIR}/${NAME}-files_${today}.tar.gz
rm -f ${TO_BACKUP_DIR}/${NAME}-db_${today}.sql.zip

