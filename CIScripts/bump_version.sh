#!/bin/bash

#Method to implement our semantic versioning
#Commit messages to master must be passed in with a release level [major] [minor] [patch] or else build will fail
bump_version(){
  export SEMVER_LAST_TAG=$((git describe --match "[0-9].[0-9].[0-9]" --tags $(git rev-list --tags --max-count=1))2>/dev/null)
  export SEMVER_RELEASE_LEVEL=$(git log --oneline -1 --pretty=%B | cat | tr -d '\n' | cut -d "[" -f2 | cut -d "]" -f1)

  if [ -z $SEMVER_LAST_TAG ]; then
      >&2 echo "No tags defined"
      SEMVER_LAST_TAG="0.0.0"
  fi

  if [ -n $SEMVER_RELEASE_LEVEL ]; then
      git clone https://github.com/fsaintjacques/semver-tool /tmp/semver &> /dev/null
      export SEMVER_NEW_TAG=$(/tmp/semver/src/semver bump $SEMVER_RELEASE_LEVEL $SEMVER_LAST_TAG)
      git tag $SEMVER_NEW_TAG &> /dev/null
  else
      >&2 echo "No release level defined"
      exit 1
  fi
}

bump_version
echo $SEMVER_NEW_TAG
