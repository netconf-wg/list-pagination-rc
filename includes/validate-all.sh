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

#printf "Testing ietf-keystore.yang (pyang)..."
#command="pyang -Werror --ietf --max-line-length=69 -p ../ ../ietf-restconf-list-pagination\@*.yang ../ietf-restconf\@*.yang"
#run_unix_cmd $LINENO "$command" 0
#command="pyang --canonical -p ../ ../ietf-keystore\@*.yang ../ietf-crypto-types\@*.yang"
#run_unix_cmd $LINENO "$command" 0
#printf "okay.\n"
#
#printf "Testing ietf-keystore.yang (yanglint)..."
#command="yanglint ../ietf-keystore\@*.yang ../ietf-crypto-types\@*.yang"
#run_unix_cmd $LINENO "$command" 0
#printf "okay.\n"
#
#printf "Testing ex-keystore.xml..."
#command="yanglint -s ../ietf-keystore\@*.yang ../ietf-crypto-types\@*.yang ex-keystore.xml"
#run_unix_cmd $LINENO "$command" 0
#printf "okay.\n"
#
#printf "Testing ex-keystore-default-operational.xml..."
#command="yanglint -s ../ietf-keystore\@*.yang ../ietf-crypto-types\@*.yang ./ietf-origin.yang ex-keystore-default-operational.xml"
#run_unix_cmd $LINENO "$command" 0
#printf "okay.\n"
#
#printf "Testing ex-keystore-default-running.xml..."
#command="yanglint -s ../ietf-keystore\@*.yang ../ietf-crypto-types\@*.yang ex-keystore-default-running.xml"
#run_unix_cmd $LINENO "$command" 0
#printf "okay.\n"
#
#printf "Testing ex-keystore-default-operational-applied.xml..."
#command="yanglint -s ../ietf-keystore\@*.yang ../ietf-crypto-types\@*.yang ./ietf-origin.yang ex-keystore-default-operational-applied.xml"
#run_unix_cmd $LINENO "$command" 0
#printf "okay.\n"


printf "Testing example-module.yang (pyang)..."
command="pyang --lint --max-line-length=69 -p ../ example-module\@*.yang"
run_unix_cmd $LINENO "$command" 0
printf "okay.\n"

printf "Testing example-module.yang (yanglint)..."
command="yanglint example-module\@*.yang"
run_unix_cmd $LINENO "$command" 0
printf "okay.\n"


printf "Testing ex-data-set.json..."
command="yanglint -s -m example-module\@*.yang ex-data-set.json"
run_unix_cmd $LINENO "$command" 0
printf "okay.\n"

printf "Testing ex-data-set.xml..."
#command="yanglint -s -m example-module\@*.yang ex-data-set.xml"
#run_unix_cmd $LINENO "$command" 0
#printf "okay.\n"
printf "DISABLED (https://github.com/CESNET/libyang/issues/1272).\n"

