#!/bin/bash

set -e

# Define GitHub username
if [ -z "$1" ]; then
  GITHUB_USER="homalg-project"
else
  GITHUB_USER="$1"
fi

# update git index
git status > /dev/null

if ! git diff-index --quiet HEAD; then
	echo "WARNING: Dirty working tree."
fi

if [[ "$(git rev-parse --abbrev-ref HEAD)" != "master" ]]; then
	echo "ERROR: Not on branch master"
	exit 1
fi

# CAP
git subtree split --prefix=ToolsForCategoricalTowers -b ToolsForCategoricalTowers-split
git push git@github.com:${GITHUB_USER}/ToolsForCategoricalTowers.jl.git ToolsForCategoricalTowers-split:master
echo ""
