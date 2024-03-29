#!/bin/bash -e

for TEMPLATE in ${APPLICATION_NAME}/config.py.deploy \
  .env.deploy \
  appspec.yml.deploy \
  deploy_scripts/*.deploy \
  k8s/*.deploy
do
  if [[ -f "$TEMPLATE" ]]; then
    echo "Replacing variables in $TEMPLATE"
    envsubst < "$TEMPLATE" > `echo "$TEMPLATE" | sed -e 's/\(\.deploy\)*$//g'`
    rm $TEMPLATE
  fi
done

chmod +x deploy_scripts/*.sh
