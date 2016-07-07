#/bin/sh

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" == "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! Do not deploy!"
  exit 0
fi


# git init
# User info
git config user.name "Admin"
git config user.email "patternfly@redhat.com"

# Add upstream authentication token
git remote add upstream https://$GH_TOKEN@github.com/dgutride/angular-patternfly.git
#git remote add upstream https://b66c28be0af6403d1d08ba042b12db5553bdac1@github.com/dgutride/angular-patternfly.git

# git fetch

# Commit generated files
git add dist --force
git commit -m "Added files generated by Travis build"

# Push to remote branch
#git push upstream $TRAVIS_BRANCH:$TARGET_BRANCH --force
git push upstream $TRAVIS_BRANCH:build_output --force -v

exit $?


#rev=$(git rev-parse --short HEAD)

#cd stage/_book

#git init
#git config user.name "Build"  #get from commit 
#git config user.email "pf-build@redhat.com" # get from original commit
# git remote add upstream "https://$GH_TOKEN@github.com/dgutride/angular-patternfly.git"

#git fetch upstream
#git reset upstream/build_target
#git pull upstream

#TARGET_BRANCH="build_target"
#git checkout build_target || git checkout --orphan build_target

#git add -A .
#git commit -m "rebuild pages at ${rev}"
#git push --repo "https://$GH_TOKEN@github.com/dgutride/angular-patternfly.git" $TRAVIS_BRANCH:build_test --force