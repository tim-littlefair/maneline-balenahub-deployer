#!/bin/sh

# prerelease_checks.sh

usage() {
   echo Usage: $0 [major] [minor] [patch]
}

set -e 

if [ ! "$#" = "3" ]
then
    usage
    exit 1
fi

semver=$1.$2.$3

if [ -z "$(grep "^version: $semver$" balena.yml)" ]
then
    echo $semver not found in balena.yml
    exit 2
else
    echo balena.yml contains valid line for $semver
fi

if [ -z "$(grep "^ENV MANELINE_VERSION $semver$" Dockerfile.template)" ]
then
    echo $semver not found in Dockerfile.template
    exit 3
else
    echo Dockerfile.template contains valid line for $semver
fi

if [ -z "$(grep "^## $semver -" CHANGELOG.md)" ]
then
    echo $semver not found in CHANGELOG.md
    exit 4
else
    echo CHANGELOG.md contains valid line for $semver
fi

_GH_URL_PREFIX=https://github.com/tim-littlefair/maneline/releases/download
if [ -z "$(curl --head --location $_GH_URL_PREFIX/release-$semver/maneline-$semver.zip)" ]
then 
    echo No rebuilt zip artifact found at GitHub
    exit 5
else
    echo Prebuilt zip file accessible at $_GH_URL_PREFIX/release-$semver/maneline-$semver.zip
fi

echo All clear to release $semver

