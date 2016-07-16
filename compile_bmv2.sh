#!/bin/bash
source env.sh
COMPILER=$P4C_BM_PATH/p4c_bm/__main__.py
if [ -f "demo.json" ]
then
    echo "demo.json exist, remove it"
    rm sf.json
fi

$COMPILER --json demo.json main.p4
