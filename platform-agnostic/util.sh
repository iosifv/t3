# Misc
#----------------------------
alias mac-kill-ds-store='find . -name "*.DS_Store" -type f -delete'
alias mac-edit-hosts='sudo nano /private/etc/hosts'

# turn hidden files on/off in Finder
#----------------------------
function mac-hidden-files-on() { defaults write com.apple.Finder AppleShowAllFiles YES ; }
function mac-hidden-files-off() { defaults write com.apple.Finder AppleShowAllFiles NO ; }

# turn shadows for windows on/off in OSX
#----------------------------
function mac-window-shadows-on() { defaults write com.apple.screencapture disable-shadow -bool true; }
function mac-window-shadows-off() { defaults write com.apple.screencapture disable-shadow -bool false; }

# pretty print stuff
#----------------------------
alias json-pretty-print='jq'

markdown () {
  pandoc $1 | lynx -stdin
}

# internet stuff
#----------------------------
alias show-my-ip-v4='curl -4 icanhazip.com'
alias show-my-ip-v6='curl -6 icanhazip.com'
alias show-my-ip-detailed='curl ifconfig.co/json --silent | jq'

function internet-ping {
  print-status "IP information:"
  curl ifconfig.co/json --silent | json-pretty-print #| json-pretty-color

  print-status "Google.com:"
  ping www.google.com -c 2

  print-status "Amazon.co.uk"
  ping www.amazon.co.uk -c 2

  print-status "Amazon.com"
  ping www.amazon.com -c 2
}

alias internet-speed='speedtest'

# Super useful weather info because asking Siri or Google is mainstream
#----------------------------
alias weather='curl "wttr.in/?format=v2"'
alias weatherLondon='curl "wttr.in/London?format=v2"'
alias weatherCluj='curl "wttr.in/Cluj?format=v2"'
alias weather3='curl v3.wttr.in'

alias dos2unix-dir='find . -name "*.*" | xargs dos2unix'
alias dir-dos2unix='dos2unix-dir'

