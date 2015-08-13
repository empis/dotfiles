#!/bin/bash -i
source $(dirname $0)/bar/config.sh
#SSH STATUS
if [ "`systemctl is-active sshd.service`" != "active" ]
then
        ssh="#DC143C";
else
        ssh="#228B22";
	run
fi
#VNC STATUS
if [ "`ps cax | grep x0vncserver`" = "" ]
then
	vnc="#DC143C";
else
	vnc="#228B22";
fi
(echo -e "^ca(1,scrun sshserver)^bg($ssh)            SSH            ^bg()^ca()\n^ca(1,scrun vncserver.sh)^bg($vnc)            VNC            ^bg()^ca()\n^ca(1,sc)         MENU EXIT         ^ca()"; sleep 15;) \
| dzen2 -x 0 -y 14 -w 400 -bg $background -fg "white" -fn $FONT -h 30 -sa c -l 3 -m h -e ""
