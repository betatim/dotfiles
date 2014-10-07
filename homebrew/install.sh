#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/homebrew-install.log
fi

# Cask is used for apps
brew upgrade brew-cask

# Install homebrew packages
brew install grc coreutils findutils bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew tap homebrew/science
brew install homebrew/dupes/grep

# Install other useful binaries
binaries=(
  graphicsmagick
  webkit2png
  zopfli
  ffmpeg
  python
  sshfs
  trash
  ack
  git
  hub
)

# Install the binaries
brew install ${binaries[@]}

exit 0
