#!/bin/bash
source env.sh
json_file="demo.json"

if [ -f "$json_file" ]
then
    # insert default rule for p4 switches
    $BMV2_PATH/tools/runtime_CLI.py --json $json_file --thrift-port 9091 < s1_cmd.txt
    $BMV2_PATH/tools/runtime_CLI.py --json $json_file --thrift-port 9092 < s2_cmd.txt
    $BMV2_PATH/tools/runtime_CLI.py --json $json_file --thrift-port 9093 < s3_cmd.txt
    $BMV2_PATH/tools/runtime_CLI.py --json $json_file --thrift-port 9094 < s4_cmd.txt
else
    echo "$json_file not found."
fi
