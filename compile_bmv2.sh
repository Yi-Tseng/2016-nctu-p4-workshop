#!/bin/bash
source env.sh
COMPILER=$P4C_BM_PATH/p4c_bm/__main__.py
if [ -f "sf.json" ]
then
    echo "sf.json exist, remove it"
    rm sf.json
fi

$COMPILER --json sf.json main.p4
