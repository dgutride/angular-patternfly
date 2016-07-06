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
git config user.email "dgutride@redhat.com" # get from original commit

#git add .

git remote add upstream "https://$GH_TOKEN@github.com/dgutride/angular-patternfly.git"
git fetch upstream
git pull upstream

#git reset upstream/gh-pages

#echo "rustbyexample.com" > CNAME

#touch .

#git add -A .
git commit -m "rebuild pages at ${rev}"
git push origin test_branch