#!/bin/bash

failed_items=""
function install_package() {
echo EXECUTING: brew install $1 $2
brew install $1 $2
[ $? -ne 0 ] && $failed_items="$failed_items $1"  # package failed to install.
}
brew tap ==> Auto-updated Homebrew!
brew tap Updated 1 tap (homebrew/core).
brew tap ==> Updated Formulae
brew tap dmd
brew tap 
brew tap caskroom/cask
brew tap homebrew/core
install_package bash-completion ''
install_package coreutils ''
install_package dos2unix ''
install_package gettext ''
install_package gnu-sed ''
install_package makedepend ''
install_package openssl ''
install_package pkg-config ''
install_package wget ''
install_package xz ''
function install_cask_package() {
echo EXECUTING: brew cask install $1
brew cask install $1
[ $? -ne 0 ] && $failed_items="$failed_items $1"  # package failed to install.
}
[ ! -z $failed_items ] && echo The following items were failed to install: && echo $failed_items
install_cask_package alfred
install_cask_package google-chrome
install_cask_package microsoft-teams
install_cask_package p4merge
[ ! -z $failed_items ] && echo The following items were failed to install: && echo $failed_items
