# backup-script
**DESCRIPTION**

 - This script is pretty simple. But it is ideal for periodic backing up your small-scale sites.
 - This script needs to be installed gdrive in order to work. Detailed information can be found at https://github.com/prasmussen/gdrive
 - This script can be used to upload your site files and database you have hosted on the VPS to Google Drive.
 -   This script does not keep your backups on your server. Also, your Google Drive account may only have 1 backup.
 - You can run this script manually or automatically using cron.
 - If you use Cron, you can decide when backups will be taken.  Just remember that your Google Drive account has 1 backup.
 - For Turkish description please visit  https://patlatbi.net/?p=1049&preview=true


----------


**USAGE**

 - First edit the "CHANGE BY YOURSELF" section according to your own information.
 - Upload the script to your server.
 - Do not forget to make the script executable. `chmod a+x backup.sh`
 - Add a cron job if you want to make a periodic backup.
 - A sample cron job (for backing up on Monday at 1:00 am UTC) :
	 - Open the crontab editor with the  `crontab -e`  command.
    - Add the bottom line: `\* 1 * * 6 /backup.sh >/dev/null 2>&1`
 - If tar, mysqldump, zip and gdrive commands are in different locations, please update `export PATH` line.
   


----------


**Explanation of Variables**

    

 1. `NAME` : A prefix for site backup files.
 2. `FROM_BACKUP_DIR` : The path to the root directory of the site files you want to back up (i.e public_html). *DO NOT USE THE "/" AT THE END OF LINE.*
 3. `TO_BACKUP_DIR` : The location where the compressed site files will be stored on the server. *DO NOT USE THE "/" AT THE END OF LINE.*
 4. `GOOGLE_DRIVE_DIR` : Your Google Drive folder ID. This folder must be empty when uploading first.
 5. `DBUSER` : MySQL database username.
 6. `DBPASS` : MySQL database password.
 7. `DBNAME` : MySQL database name.
 

*The command is simple but the description is complicated* :)
