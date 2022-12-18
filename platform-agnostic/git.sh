#!/usr/bin/env bash

# Git pulls a certain branch
function t3-gpush {
  local CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

  gum style --foreground=3 "Changes found in the following files:"
  git status -s

  gum style --foreground=3 "Pushing all changes to: origin/${CURRENT_BRANCH}"
  git add .

  TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
  SCOPE=$(gum input --placeholder "scope")

  # Since the scope is optional, wrap it in parentheses if it has a value.
  test -n "$SCOPE" && SCOPE="($SCOPE)"

  # Pre-populate the input with the type(scope): so that the user may change it
  SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
  DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")

  # Commit these changes
  gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"

  git commit -m "[${CURRENT_BRANCH}] - $1"
  git push origin $CURRENT_BRANCH

  gum style --foreground=3 "====================================="
  git status
  gum style --foreground=3 "====================================="




}