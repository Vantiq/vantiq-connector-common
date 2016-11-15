#!/bin/bash
#
# Script that imports a given connector or adapter to Vantiq.
#
# Usage: vantiq-import-adapter.sh <repo> <CLI args>
#
#  <repo>: The GitHub repo URL used to download the connector/adapter
#  <CLI args>: The arguments used to connect to Vantiq from the CLI (e.g. -s <profile>)
#
# Note: This script assumes that GIT ("git") and the Vantiq CLI ("vantiq") commands
#       are available in the path.
#

if [[ $# -lt 2 ]]; then
    echo "Usage: vantiq-import-adapter.sh <repo> <CLI args>"
    echo ""
    echo "  <repo>     : The GitHub repo URL used to download the connector/adapter"
    echo "  <CLI args> : The arguments used to connect to Vantiq from the CLI (e.g. -s <profile>)"
    echo ""
    exit 1
else
    repo=$1
    shift
    cliArgs=$*
fi

which -s git    || { echo "git not found";        exit 1; }
which -s vantiq || { echo "Vantiq CLI not found"; exit 1; }

# Function that performs the tasks required
function doCloneAndImport() {
    repo=$1
    repoDir=`basename $1 .git`

    git clone $repo
    cd $repoDir

    if [[ $1 == *"-connector-"* ]]; then
        shift
        (cd vantiq; vantiq $* import)
    elif [[ $1 == *"-adapter-"* ]]; then
        shift
        vantiq $* import
    fi
}

# Create a temporary directory
tmpdir=`mktemp -d` || exit 1

# Clone repo into directory and import the connector/adapter
( cd $tmpdir ; doCloneAndImport $repo $cliArgs )

# Clean up directory
rm -fr $tmpdir