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

# FIXME: add validation for ex-api-combo-rpc-reply.xml
#   ^-- this is the only INSERTED file containing a validatable payload...
#   ^-- seems like the HTML-header should be stripped off and the rest validated against example-social.yang?
#   ^-- but where does the "xml-list" come from? !!!
#          ^-- oh, I see it's defined in this draft but:
#                - note that the example in the -nc draft also use the "xml-list" media-type - why?
#                    - should the "xml-list" be defined in a neutral document?
printf "Testing ex-api-combo-rpc-reply.xml..."
command="yanglint -t reply ../../list-pagination/includes/example-social@$DATE.yang ex-api-combo-rpc-reply.xml"
run_unix_cmd $LINENO "$command" 0
printf "okay.\n"
 
