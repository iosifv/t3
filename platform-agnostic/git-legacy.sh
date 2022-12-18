#!/usr/bin/env bash

# Simple aliases with less letters
alias gst="git status"
alias gd="git diff"
alias gru='git remote update'


# Git log in a nice format
alias gl='git log --pretty=format:"[%C(auto)%h][%Cgreen%an%Creset]%C(auto)%d %s (%Cblue%ar%Creset)" --graph --color'


# List all git ignored files
alias gignore='git ls-files --others -i --exclude-standard'


# Git pulls a certain branch
function gtake {
  git remote update
  git checkout $1
  git pull origin $1
  echo "${C_YELLOW}====================================="
  git status
  echo "=====================================${C_RESET}"
}

# Open the online location of the repository
# Todo: argument pr/br/cm - to go to certain bitbucket pages automatically
function gonline {
    local REMOTE_URL=$(git config --get remote.origin.url)

    # REMOTE_URL = git@bitbucket.org:{OWNER}/{PROJECT}.git
    # HTTP_URL   = http://bitbucket.org/{OWNER}/{PROJECT}

    local HTTP_URL=${REMOTE_URL/\:/\/}
    HTTP_URL=${HTTP_URL/git@/}
    HTTP_URL=${HTTP_URL/.git/}
    HTTP_URL=http://${HTTP_URL}/
    echo Opening ${HTTP_URL}
    open ${HTTP_URL}
}

# Delete all branches which are merged and don't exist on origin
function gdelete {
    echo "${C_YELLOW}====== Pruning remote branches ======${C_RESET}"
    git remote prune origin
    echo "${C_YELLOW}====== Deleting local branches ======${C_RESET}"
    git branch --merged | grep -v "\*" | grep -v "master" | grep -v "production" | grep -v "development" | grep -v "test" | grep -v "uat" | xargs -n 1 git branch -d
    echo "${C_YELLOW}====== Status of local/remotes ======${C_RESET}"
    git branch -va
}

# Push all changes to origin branch named as current branch
# Ex: gpush "<<commit-message>>"
#----------------------------
function gpush {
  local CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

  echo "${C_YELLOW}Changes found in the following files:${C_RESET}"
  git status -s

  echo "${C_YELLOW}Pushing all changes to: origin/${C_GREEN}${CURRENT_BRANCH}${C_RESET}"
  git add .
  git commit -m "[${CURRENT_BRANCH}] - $1"
  git push origin $CURRENT_BRANCH

  echo "${C_YELLOW}====================================="
  git status
  echo "=====================================${C_RESET}"
}

# Commits everything and sets the branch in the note
#----------------------------
function gcommit {
  local CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

  echo "${C_YELLOW}Changes found in the following files:${C_RESET}"
  git status -s

  echo "${C_YELLOW}Pushing all staged files to: origin/${C_GREEN}${CURRENT_BRANCH}${C_RESET}"
  git commit -m "[${CURRENT_BRANCH}] - $1"
  git push origin $CURRENT_BRANCH

  echo "${C_YELLOW}====================================="
  git status
  echo "=====================================${C_RESET}"
}

# Creates a new branch and sets upstream
#----------------------------
function gbranch {
  git checkout -b $1
  git push --set-upstream origin $1
  echo "${C_YELLOW}====================================="
  git status
  echo "=====================================${C_RESET}"
}

# Push all changes as a fixup to the previous commit
# Ex: gfixup "<<commit-message>>"
#----------------------------
function gfixup {
  git add .
  git commit --fixup $(git rev-parse --verify HEAD)  # hash of the last commit
  git push origin $(git rev-parse --abbrev-ref HEAD) # branch I am on right now
  echo "${C_YELLOW}====================================="
  git status
  echo "=====================================${C_RESET}"
}

# Ex: gc "<<commit-message>>"
#----------------------------
function gc {
  git commit -m "$1"
}