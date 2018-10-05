#!/usr/bin/env bash
#
# {{ ansible_managed }}
#

#-------------------------------------------------------------------------------------------
# Convenience script for running the Gradle wrapper (gradlew).
# Install it in PATH and it will recursively find gradlew upwards from current directory.
# Once it has been found, it will be invoked with all original arguments.
#-------------------------------------------------------------------------------------------

function find_gradlew()
{
    DIR=$1
    [[ "$DIR" = "/" ]] && return 1

    [[ -f "$DIR/gradlew" ]] && { echo "$DIR/gradlew"; return 0; }

    find_gradlew $( dirname $DIR )
}

GRADLEW=$( find_gradlew `pwd` )
# if gradle wrapper exists use it, otherwise use gradle from system path
[[ -f "$GRADLEW" ]] && CMD="$GRADLEW" || CMD="$HOME/.sdkman/candidates/gradle/current/bin/gradle"

[[ -f "$CMD" ]] || CMD="/usr/bin/gradle"

[[ -f "$CMD" ]] || { echo "Cannot find neither gradlew, $HOME/.sdkman/candidates/gradle/current/bin/gradle nor /usr/bin/gradle"; exit 1; }

$CMD "$@"
