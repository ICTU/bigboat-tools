#!/bin/bash
appName=$1
project=$2
apiKey=$3
tag=$4

appDefinitions=`curl -sS -XGET "http://www.dashboard.$project.ictu/api/v2/apps/" -H "api-key:$apiKey"`
numberOfApps=`echo $appDefinitions | jq "[.[] | select(.name==\"$appName\")] | length"`
numberOfApps=`expr $numberOfApps - 1`
for i in `seq 0 ${numberOfApps}`; 
do
  appVersion=`echo $appDefinitions | jq "[.[] | select(.name==\"${appName}\")][${i}]" | jq '.version' -r`
  appDefinition=`curl -sS -XGET "http://www.dashboard.$project.ictu/api/v2/apps/$appName/$appVersion/files/bigboatCompose" -H "api-key:$apiKey"`
  echo $appDefinition | sed 's/^.*tags:\s*//' | sed 's/\s*\w*:.*//' | grep -sw "$tag"
  found=$?

  if [ $found == 1 ]; 
  then
    echo delete $appName:$appVersion
    curl -sS -XDELETE "http://www.dashboard.$project.ictu/api/v2/apps/$appName/$appVersion" -H "api-key:$apiKey"
  else
    echo keep $appName:$appVersion
  fi
done
