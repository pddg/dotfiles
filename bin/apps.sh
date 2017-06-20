#! /bin/bash

. ./bin/func.sh

script_section "Check installed applications..."

[ "$PLATFORM" = "osx" ] || info "This section only for macOS. [PASS]" 

IFS_back=$IFS
IFS=$'\n'

APPLICATIONS=`ls -v1 /Applications`

for line in `cat ${EXPECTED_APPS_CSV} | grep -v '^#.*'`;
do
  # 空白行を読み飛ばす
  if [ -z $line ]; then
    continue
  fi
  
  # app_name,app_urlなCSVを読み込む
  APP_NAME=`echo $line | sed 's/"//g' | sed "s/'//g" | cut -d "," -f 1`
  APP_URL=`echo $line | sed 's/"//g' | sed "s/'//g" | cut -d "," -f 2`

  if echo "${APPLICATIONS[@]}" | grep -e "$APP_NAME" > /dev/null 2>&1; then
    info "$APP_NAME [\033[0;32minstalled\033[0;39m]"
  else
	warn "$APP_NAME [\033[0;33mnot installed\033[0;39m]\t-> $APP_URL"
  fi
done
