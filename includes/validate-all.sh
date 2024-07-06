#!/bin/bash

run_unix_cmd() {
  # $1 is the line number
  # $2 is the cmd to run
  # $3 is the expected exit code
  output=`$2 2>&1`
  exit_code=$?
  if [[ $exit_code -ne $3 ]]; then
    printf "failed (incorrect exit status code) on line $1.\n"
    printf "  - exit code: $exit_code (expected $3)\n"
    printf "  - command: $2\n"
    if [[ -z $output ]]; then
      printf "  - output: <none>\n\n"
    else
      printf "  - output: <starts on next line>\n$output\n\n"
    fi
    exit 1
  fi
}

DATE=`date +%Y-%m-%d`

printf "Testing ex-api-combo-rpc-reply.xml...DISABLED!\n" # how to validate xml-list?
#tail -n+7 ex-api-combo-rpc-reply.xml > ex-api-combo-rpc-reply.xmlonly.xml
#command="yanglint -e -t data ietf-datastores@2018-02-14.yang ../../list-pagination/ietf-list-pagination@$DATE.yang ../../list-pagination/includes/example-social@$DATE.yang ex-api-combo-rpc-reply.xmlonly.xml"
#run_unix_cmd $LINENO "$command" 0
#rm -f ex-api-combo-rpc-reply.xmlonly.xml
#printf "okay.\n"


printf "Testing ex-api-combo-rpc-reply.json...DISABLED\n" # wrap with a "members" dict?
#tail -n+7 ex-api-combo-rpc-reply.json > ex-api-combo-rpc-reply.jsononly.json
#command="yanglint -e -t data ietf-datastores@2018-02-14.yang ../../list-pagination/ietf-list-pagination@$DATE.yang ../../list-pagination/includes/example-social@$DATE.yang ex-api-combo-rpc-reply.jsononly.json"
#run_unix_cmd $LINENO "$command" 0
#rm -f ex-api-combo-rpc-reply.jsononly.json
#printf "okay.\n"

