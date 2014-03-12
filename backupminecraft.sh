#!/bin/bash
#note on shebang: Bracket Expansion {31..2} is only supported in Bash.
#backupminecraft.sh

for i in {31..2}
do
        let iminus1=$i-1
        cp -a /home/hostaccount/mcraftworldbackup.d/$iminus1/. \
        /home/hostaccount/mcraftworldbackup.d/$i

        echo "copied $iminus1 to $i at" `date` >> /home/hostaccount/mcraftworldbackup.d/log
        echo "copied $iminus1 to $i"
done

cp -r /home/hostaccount/minecraft/world /home/hostaccount/mcraftworldbackup.d/1
echo "copied current world into 1 at" `date` >> /home/hostaccount/mcraftworldbackup.d/log
echo "copied current world into 1"

rm -r /home/hostaccount/mcraftworldbackup.d/31
echo "Deleted 31 at" `date` >> /home/hostaccount/mcraftworldbackup.d/log
echo "Deleted 31"

echo "DONE AT" `date` >> /home/hostaccount/mcraftworldbackup.d/log
echo "DONE"
