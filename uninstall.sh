#!/bin/sh
#
#
#
#


### Check if HearthLog or any HearthLog components are installed

  if [[ ! -d "/Applications/HearthLog.app" ]] && [[ ! -a "/Library/LaunchDaemons/org.hearthlog.bpf.chown.plist" ]] && [[ ! -a "/Library/Scripts/hearthlogBpfChown.bash" ]]; then
    echo "Error: you don't seem to have HearthLog installed" >&2
    exit 1
  fi

### Setup Path and find TTY

  PATH=/bin:/sbin:/usr/bin:/usr/sbin
  TTY="/dev/$( ps -p$$ -o tty | tail -1 | awk '{print$1}' )"

### Verify that the user wishes to uninstall
  read -p "Uninstall HearthLog [y/n]? " ANSWER < $TTY
  [[ $ANSWER == "y" ]] || exit 1
  echo "Uninstalling HearthLog..."

### remove LaunchDaemon plist
  sudo rm /Library/LaunchDaemons/org.hearthlog.bpf.chown.plist

### remove bpf chown script
  sudo rm /Library/Scripts/hearthlogBpfChown.bash

### remove the .app in from /Applications
  sudo rm -R /Applications/HearthLog.app

  echo "HearthLog has been uninstalled"

  exit 0
