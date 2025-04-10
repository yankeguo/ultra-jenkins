#!/bin/bash

# shellcheck disable=SC2086
exec java $JAVA_OPTS -jar /opt/jenkins.war $JENKINS_OPTS
