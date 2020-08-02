#!/bin/bash

usage() {
	echo "Usage: $0 [.kts file | kotlin code]"
	echo "For more ways to use kscript see here: https://github.com/holgerbrandl/kscript#script-input-modes"
}

execute_code() {
	docker run --rm -i kscript "$*"
}

execute_file() {
	docker run --rm -i kscript "$(cat $1)" ${@:2}
}

route() {
	if (( $# == 0)); then
		usage
		exit -1
	fi

	local first_param="$1"
	if [[ $first_param == *.kts ]]; then
		execute_file $@
	else
		execute_code $@
	fi
}

route $@
