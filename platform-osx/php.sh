#============================
# PHP +++====================
#============================

# Awesome php switch
#----------------------------
# Todo: make a list of constants to check for file version
function php-switch {
  echo "Switching ${C_GREEN}php$(php -r " echo phpversion()[0] . phpversion()[2];") => php$1${C_RESET}\n"

  brew unlink php$(php -r " echo phpversion()[0] . phpversion()[2];")
  echo "${C_YELLOW}===================================${C_RESET}"
  brew link php$1

  echo "${C_YELLOW}"
  php -v
  echo "${C_RESET}"
}

function php-install-all {
  brew tap shivammathur/php
  brew install shivammathur/php/php@5.6
  brew install shivammathur/php/php@7.0
  brew install shivammathur/php/php@7.1
  brew install shivammathur/php/php@7.2
  brew install shivammathur/php/php@7.3
  brew install shivammathur/php/php@7.4
  brew install php@8.0
  brew install php@8.1
  brew install shivammathur/php/php@8.2
  brew install shivammathur/php/php@8.3
  brew services list
}



function switch-php-test {

# determine versions of PHP installed with HomeBrew
INST=($(brew ls --versions | ggrep -E 'php(@.*)?\s' | ggrep -oP '(?<=\s)\d\.\d' | uniq | sort))

echo $INST
}


function switch-php {

  gum style --foreground 3 --italic "Current version..."
  php -v

  gum style --italic --foreground 3 "Unlinking PHP..."
  # brew unlink php
  brew unlink php@$(php -r " echo phpversion()[0] . '.' .  phpversion()[2];")

  gum style --italic --foreground 3 "What PHP version are you switching to?"

  # PLATFORM_LIST=$(brew list | grep php@)
  # CHOSEN_PLATFORM=$(gum choose ${PLATFORM_LIST})


  CHOSEN_PLATFORM=$(gum choose "php@8.1" "php@7.1")

  gum style --italic --foreground 3 "Linking PHP...$($CHOSEN_PLATFORM)"
  brew link --overwrite $CHOSEN_PLATFORM
  brew link --force $CHOSEN_PLATFORM


  gum style --italic --foreground 3 "New version..."
  php -v
}