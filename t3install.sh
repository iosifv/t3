#!/usr/bin/env bash

# Testing if `gum` is installed
if ! [ -x "$(command -v gum)" ]; then
  echo 'Error: gum is not installed.' >&2
  echo 'Try `brew install gum`.' >&2
  exit 1
fi

# Starting up
gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 50 --margin "1 2" --padding "1 4" \
	'Installing T3' '(powered by Bubble Gum)'

# Generating Platform List from existing directories
PLATFORM_LIST=""
for f in ./platform-*; do {
    if [ "$f" != "./platform-agnostic" ]
    then
        PLATFORM_LIST+=$(echo "$f" | cut -d "-" -f 2);
        PLATFORM_LIST+=" "
    fi
} done
# echo "$PLATFORM_LIST"

# Setting up variables
gum style --italic "What platform are you installing on?"
CHOSEN_PLATFORM=$(gum choose ${PLATFORM_LIST})
echo "> $CHOSEN_PLATFORM"
echo ""

# gum style --italic  "What's your top shell rc file to append?"
# CHOSEN_RC_FILE=$(gum input --value="~/.zshrc" )
# echo "> $CHOSEN_RC_FILE"
# echo ""

PATH_FOR_T3=$(pwd)

# Prepare code to add
APPEND_CODE="\n\n# T3 Config\n# ==========\n"
APPEND_CODE+="PLATFORM_NAME=${CHOSEN_PLATFORM}\n"
APPEND_CODE+="source ${PATH_FOR_T3}/loader.sh"

# Confirming generated code
gum style --italic "Generated code:"
echo $APPEND_CODE

# Commit changes if user confirms
gum confirm "Are you ok to add this code to ~/.zshrc?" && echo $APPEND_CODE >> ~/.zshrc || exit 1

# Showing the user the changes
gum style --italic "Tailing ~/.zshrc"
gum pager < ~/.zshrc

# Reset terminal
source ~/.zshrc