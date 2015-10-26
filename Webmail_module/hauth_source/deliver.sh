#!/bin/sh

# $path of course has to point to the same filesystem as # where your mails are.

vmailhome=/vmail
pname=deliver.input.$$
path=$vmailhome/tmp/$pname
notifypath=$vmailhome/notify
snappath=$notifypath/snap

cat > $path

if [ ! -d $vmailhome/tmp ]; then
	mkdir -p $vmailhome/tmp
fi

if [ ! -d $snappath ]; then
	mkdir -p $snappath
fi

sender=$1
shift
recipients=$*

echo "$recipients" > $notifypath/$pname

for recipient in $recipients; do
  /usr/local/dovecot/libexec/dovecot/deliver -f $sender -d $recipient -p $path
  exit=$?
  if [ $exit != 0 ]; then
	exit $exit
  fi
done

touch $snappath/$pname

exit 0
