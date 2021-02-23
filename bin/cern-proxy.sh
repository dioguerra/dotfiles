#!/bin/sh

case $1 in
    connect)
        sshuttle --ns-hosts 137.138.16.5 -D -vr dtomasgu@lxplus-cloud.cern.ch 137.138.0.0/16 128.141.0.0/16 128.142.0.0/16 188.184.0.0/15 --daemon --pidfile /tmp/cern-proxy
        shift
    ;;
    disconnect)
        kill `cat /tmp/cern-proxy`
        shift
    ;;
    *)
        # unknown option
   ;;
esac
