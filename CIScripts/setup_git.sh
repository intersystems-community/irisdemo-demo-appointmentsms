#!/bin/bash

setup_git() {
  # Set the user name and email to match the API token holder
  # This will make sure the git commits will have the correct photo
  # and the user gets the credit for a checkin
  git config --global user.email ${GITHUBEMAIL}
  git config --global user.name ${GITHUBUSER}
  git config --global push.default matching
  # Get the credentials from a file
  git config credential.helper "store --file=.git/credentials"

  # This associates the API Key with the account
  echo "https://${GITHUBTOKEN}:@github.com" > .git/credentials
}

setup_git
exit 0
