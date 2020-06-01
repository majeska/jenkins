#!/bin/bash

JENKINS_CLI=/usr/local/bin/jenkins-cli.jar
URL=http://127.0.0.1:8080

if [ ! -f "$JENKINS_CLI" ]; then
    wget -O "$JENKINS_CLI" $URL/jnlpJars/jenkins-cli.jar
    echo "Downloaded: jenkins-cli.jar"	
fi

UPDATE_LIST=$( java -jar "$JENKINS_CLI" -s $URL -auth $JENKINS_USER:$JENKINS_PASS list-plugins | grep -e ')$' | awk '{ print $1 }' );

if [ ! -z "${UPDATE_LIST}" ]; then 
    echo "INFO: Updating Jenkins Plugins - ${UPDATE_LIST}"
    java -jar "$JENKINS_CLI" -s $URL -auth $JENKINS_USER:$JENKINS_PASS install-plugin $UPDATE_LIST;

#    echo "INFO: Restarting Jenkins"
#    java -jar "$JENKINS_CLI" -s $URL -auth $JENKINS_USER:$JENKINS_PASS safe-restart;
fi
