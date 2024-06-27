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

function internet-speed-world {
  print-status "New York:"
  wget --output-document=/dev/null -q --show-progress http://speedtest-nyc1.digitalocean.com/10mb.test
  print-status "Amsterdam:"
  wget --output-document=/dev/null -q --show-progress http://speedtest-ams2.digitalocean.com/10mb.test
  print-status "San Francisco:"
  wget --output-document=/dev/null -q --show-progress http://speedtest-sfo1.digitalocean.com/10mb.test
  print-status "Singapore:"
  wget --output-document=/dev/null -q --show-progress http://speedtest-sgp1.digitalocean.com/10mb.test
  print-status "London:"
  wget --output-document=/dev/null -q --show-progress http://speedtest-lon1.digitalocean.com/10mb.test
  print-status "Frankfurt:"
  wget --output-document=/dev/null -q --show-progress http://speedtest-fra1.digitalocean.com/10mb.test
  print-status "Toronto:"
  wget --output-document=/dev/null -q --show-progress http://speedtest-tor1.digitalocean.com/10mb.test
  print-status "Bangalore:"
  wget --output-document=/dev/null -q --show-progress http://speedtest-blr1.digitalocean.com/10mb.test
}

alias internet-graph='speedometer -r eth0'

# Super useful weather info because asking Siri or Google is mainstream
#----------------------------
alias weather='curl wttr.in'
alias weather2='curl "wttr.in/?format=v2"'
alias weatherLondon='curl wttr.in/London'
alias weatherCluj='curl wttr.in/Cluj'
alias weatherWroclaw='curl wttr.in/Wroclaw'





alias dos2unix-dir='find . -name "*.*" | xargs dos2unix'
alias dir-dos2unix='dos2unix-dir'

