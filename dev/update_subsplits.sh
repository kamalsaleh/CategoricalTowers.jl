#!/bin/bash

set -e

# Check if token exists
if [ -z "$JULIA_SUBSPLIT_TOKEN" ]; then
  echo "ERROR: Missing JULIA_SUBSPLIT_TOKEN"
  exit 1
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

# ToolsForCategoricalTowers
git subtree split --prefix=ToolsForCategoricalTowers -b ToolsForCategoricalTowers-split > /dev/null 2>&1
git push https://${JULIA_SUBSPLIT_TOKEN}@github.com/homalg-project/ToolsForCategoricalTowers.jl.git ToolsForCategoricalTowers-split:master
echo "Pushed to ToolsForCategoricalTowers.jl"
