#!/bin/bash
export LC_CTYPE=zh_TW.UTF-8
export LC_MESSAGES=zh_TW.UTF-8
export LC_TIME=en_US.UTF-8

replaceDoubleQuotes(){ 
    echo $(echo $@ | sed -e "s/\"//g")
}

if [ -z "$1" ]; then
    echo "please give me a war download url"
else
    CURRENT_PATH=/root
    PROJECT_NAME=nodeProject
    INSTALL_PATH=${CURRENT_PATH}/${PROJECT_NAME}/install.sh
    RUN_PATH=${CURRENT_PATH}/${PROJECT_NAME}/run.sh
    PROJECT_PATH=${CURRENT_PATH}/${PROJECT_NAME}
    PACKAGE_JSON_PATH=${PROJECT_PATH}/package.json
    WAR=$1
    fileName=$(echo $WAR | sed -e "s/^.*[^/]*\///g")
    wget -O ${CURRENT_PATH}/${fileName} $WAR 
    if [[ "$fileName" =~ .zip$ ]] ; then
        unzip ${CURRENT_PATH}/${fileName} -d ${PROJECT_PATH}
    else
        mkdir ${PROJECT_PATH}
        tar xvf ${CURRENT_PATH}/${fileName} -C ${PROJECT_PATH}
    fi
    cd $PROJECT_PATH

    if [ -f $PACKAGE_JSON_PATH ]; then
        MAIN_FILE_PATH=$(cat $PACKAGE_JSON_PATH | jq ".main")
        MAIN_FILE_PATH=$(replaceDoubleQuotes $MAIN_FILE_PATH)
    fi
    #echo $MAIN_FILE_PATH
    #echo $PACKAGE_JSON_PATH

    if [ -f $INSTALL_PATH ]; then
        $INSTALL_PATH
    else
        npm install
    fi
    if [ -f $RUN_PATH ]; then
        $RUN_PATH --no-daemonize -cmd start
    else
        if [ -z "$MAIN_FILE_PATH" ]; then
            node server.js
        else
            node $MAIN_FILE_PATH
        fi
    fi

fi
