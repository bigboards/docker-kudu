#!/bin/bash

DEAMON=$1

export FLAGS_log_dir=/var/log/kudu

[ -z $KUDU_CONF ] && echo "No KUDU_CONF environment variable found! I don't know where to get the kudu configuration" && exit 1

case $1 in
	"master")
		EXEC=/usr/sbin/kudu-master
		export FLAGS_rpc_bind_addresses=0.0.0.0:7051
		;;
	"tserver")
		EXEC=/usr/sbin/kudu-tserver
		export FLAGS_rpc_bind_addresses=0.0.0.0:7050
		;;
	*)
		echo "Unknown daemon '$1'" && exit 1
		;;
esac

${EXEC} --flagfile="${KUDU_CONF}"