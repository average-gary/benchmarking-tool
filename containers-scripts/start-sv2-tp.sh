#!/bin/bash

# Start bitcoind in the background with IPC enabled
/bitcoin/bin/bitcoin -m -ipcbind=unix "$@" &

# Wait a moment for bitcoind to start
sleep 5

# Start sv2-tp in the foreground
exec /bitcoin/bin/sv2-tp -sv2 -sv2port="$SV2_PORT" -sv2interval="$SV2_INTERVAL" -sv2feedelta=0 -debug=sv2 -loglevel=sv2:debug -sv2bind=0.0.0.0 "$@"