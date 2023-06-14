#!/usr/bin/env bash

pretty_print() {
  printf "\n%b\n" "$1"
}
# 

pretty_print "Setting up TMAU Web Environment..."


if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..." 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
      pretty_print "Put Homebrew location earlier in PATH ..."
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
    fi

  else
    pretty_print "You already have Homebrew installed...good job!"
fi

pretty_print "Updating brew formulas"
  	brew update

pretty_print "Installing NodeJS"
  	brew install node@18

pretty_print "Installing NVM"
  	brew install nvm

pretty_print "Checking for Git. If prompted, follow the on screen instructions"
git --version