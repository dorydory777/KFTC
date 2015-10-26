#!/bin/sh

usage(){
	echo "Usage: $0 {start|stop|restart}"
	exit 1
}

[ $# -gt 0 ] || usage

ACTION=$1

case "$ACTION" in
	start)
		if [ ! -z "`ps -eaf | grep java | grep Dhauth | grep -v grep | awk '{print $2}'`" ]
		then
			echo "Already Running!!"
			exit 1
		fi

		echo HAUTH starts...
		/vmail/hauth/bin/startup.sh
	;;

	stop)
		if [ -z "`ps -eaf | grep java | grep Dhauth | grep -v grep | awk '{print $2}'`" ]
		then
			echo "Handy Auth was not started."
		else
			/vmail/hauth/bin/shutdown.sh
		fi

	;;

	restart)
		$0 stop $*
		sleep 5
		$0 start $*
	;;

	*)
		usage
        ;;
esac

exit 0
