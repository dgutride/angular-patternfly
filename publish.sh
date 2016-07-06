#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" == "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! Do not deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

#cd stage/_book

git init
git config user.name "Dana Gutride"  #get from commit 
git config user.email "$COMMIT_AUTHOR_EMAIL" # get from original commit

git remote add upstream "https://$GH_TOKEN@github.com/dgutride/angular-patternfly.git"
git fetch upstream
git reset upstream/build_target
#git pull upstream

TARGET_BRANCH="build_target"
#git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH

git add -A .
git commit -m "rebuild pages at ${rev}"
git push upstream TARGET_BRANCH