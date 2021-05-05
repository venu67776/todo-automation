#!/bin/bash
COMPONENT=$1
    if [ ! -f components/"${COMPONENT}.sh ]; then
 echo " Invalid component name Is Provided "
  exit 1
  fi

bash components/"${COMPONENT}.sh

