#!/bin/bash

DEAMON=$1

export FLAGS_log_dir=/var/log/kudu
export FLAGS_rpc_bind_addresses=0.0.0.0:7051

case $1
	"master")
		EXEC=/usr/sbin/kudu-master
		CONF=/etc/kudu/conf/master.gflagfile
		;;
	"tserver")
		EXEC=/usr/sbin/kudu-tserver
		CONF=/etc/kudu/conf/tserver.gflagfile
		;;
	*)
		echo "Unknown daemon '$1'" && exit 1
		;;
esac

${EXEC} --flagfile="${CONF}"