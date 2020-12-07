#!/bin/bash
#
# Copyright (C) 2020 iNTENCE automotive electronics GmbH.
#
# All rights reserved. Bruderwoehrdstrasse 29, 93055 Regensburg,
# info@intence.de
#

version=1.0.0
self="$0"
current_year=$(date +"%Y")

invalid_files=""

print_usage() {
  program_name=$(basename "$self")
  cat <<-EOF
${program_name} ${version}
Usage: ${program_name} File1 [File2 ... FileN]
EOF
}

check() {
  if head -10 "$1" | grep -iq copyright; then
    if ! grep -e "copyright.*$current_year" -iq "$1"; then
      invalid_files="$invalid_files $1"
    fi
  fi
}

process_invalid_files() {
  if [ -n "$invalid_files" ]; then
    echo "The following files have an invalid copyright year specified:"
    for file in $invalid_files; do
      echo "    $file"
    done
    exit 1
  fi
}

main() {
  if [ $# -lt 1 ]; then
    print_usage
    exit 1
  fi

  for i in $*; do
    check "$i"
  done

  process_invalid_files
}

main "$@"
