#!/bin/sh
#CLASSPATH=/handy/gw/hip/lib:/handy/gw/jhoms/lib:/handy/gw/hip/shared:/handy/gw/hip/shared/ojdbc14.jar:.:/usr/local/jdk1.5.0_17/bin:/usr/local/jdk1.5.0_17/lib:/usr/local/jdk1.5.0_17/jre/lib

LANG=ko_KR
LC_ALL=ko_KR.euckr

BASE=${HOME}/hauth/si4biz/mail
CLSS=$CLASSPATH:${BASE}/classes:${BASE}

for jars in `ls ${BASE}/lib/*.jar`; do
	CLSS=${CLSS}:$jars
done

echo "CLASSPATH=${CLSS}"

java -DSI4BIZ.SENDMAIL -Dfile.encoding=euc-kr -Dsi4biz.config.dir=${BASE}/conf/ -Dlog4j.configuration=file:${BASE}/conf/log4j.properties -cp $CLSS com.si4biz.util.SmtpUtil > ${BASE}/bin/sendmail.out
date >> ${BASE}/bin/sendmail.out

echo "SEND OK"
