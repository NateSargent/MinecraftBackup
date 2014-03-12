MinecraftBackup
===============

MinecraftBackup is a Bash script that creates local backups of a minecraft server's "world" directory.

I target Bash specifically because it supports Brace expansion. See script line 5:

for i in {31..2}

In retrospect, a more conventional for-loop approach would have made my script more portable, as not all shells support this feature.

Minecraft's "world" is stored in a directory that is appropriatelly called "world". I created a separate directory called "mcraftworldbackup.d" with subdirectories numbered 1-30 and a log file.

EXPLANATION OF SCRIPT FUNCTION:

First, we iterate through 31-2 with aforementioned brace expansion. Note that the structure of directories numbered 1-30 must already exist, the script will not create them. This loop takes the contents of folder 30 and copies it to a new subdirectory labeled 31 on the first pass, copies 29 into 30 on the second, and so on. As this loop exists, there are 31 folders numberd 1-31. Note that the contents of 1 and 2 are identical.

Next, we copy the "world" directory Minecraft is currently using to 1. This step ensures that the most recent copy of the "world" directory is always in the directory 1.

Finally, we delete directory 31.

I run this script once every 24 hours using cron. This gives me backups for the past 30 days. Running it every 12 hours would give you backups for the past 15 days, two a day.
