@REM Maven Wrapper Script for Windows
@REM
@REM Required Environment Variables:
@REM   JAVA_HOME - location of a JDK home dir

@echo off

set MAVEN_CMD=mvn
%MAVEN_CMD% %*
#!/bin/sh
# Maven Wrapper Script for Unix/Mac

MAVEN_PROJECTBASEDIR="${MAVEN_BASEDIR:-"$(cd "$(dirname "$0")" && pwd)"}"
MAVEN_OPTS="$(concat_lines "$MAVEN_PROJECTBASEDIR/.mvn/jvm.config") $MAVEN_OPTS"

exec mvn "$@"

