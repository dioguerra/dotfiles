#!/bin/bash

case $1 in
    connect)
        sshuttle --dns -vr dtomasgu@aiadm.cern.ch 137.138.0.0/16 128.141.0.0/16 128.142.0.0/16 188.184.0.0/15 --daemon --pidfile /tmp/cern-proxy.pid
        shift
    ;;
    disconnect)
        kill `cat /tmp/cern-proxy.pid`
        shift
    ;;
    *)
        # unknown option
   ;;
esac
