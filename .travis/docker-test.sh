#!/usr/bin/env bash
set -e
echo -e "${ANSI_YELLOW}Building ${CONTRIB_NAME}...${ANSI_RESET}" && echo -en 'travis_fold:start:script\\r'

docker exec COQ /bin/bash --login -c "
  export PS4='+ \e[33;1m(\$0 @ line \$LINENO) \$\e[0m '; set -ex
  export OPAMYES=true
  export OPAMJOBS=2
  export OPAMVERBOSE=true
  sudo chown -R coq:coq /home/coq/${CONTRIB_NAME}
  ( ${CMD} )
  " script

echo -en 'travis_fold:end:script\\r'
