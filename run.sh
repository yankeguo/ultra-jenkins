#!/bin/bash

# configure git since user may mount home directory
git config --global --add safe.directory '*'
git config --global init.defaultBranch main

# allows jenkins from mounted volume to run
mkdir -p /opt/jenkins

if [ ! -f /opt/jenkins/jenkins.war ]; then
  echo "Copying jenkins.war to /opt/jenkins"
  cp -f /opt/jenkins.original/jenkins.war /opt/jenkins/jenkins.war
fi

# shellcheck disable=SC2086
exec java $JAVA_OPTS -jar /opt/jenkins/jenkins.war $JENKINS_OPTS
