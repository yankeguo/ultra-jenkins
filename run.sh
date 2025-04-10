#!/bin/bash

# configure git since user may mount home directory
git config --global --add safe.directory '*'
git config --global init.defaultBranch main

# shellcheck disable=SC2086
exec java $JAVA_OPTS -jar /opt/jenkins.war $JENKINS_OPTS
