#!/bin/bash

set -eu

exec java $JAVA_OPTS -jar /opt/jenkins.war $JENKINS_OPTS
