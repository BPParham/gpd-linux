#!/bin/bash

Current_Version=1.2.0042
Year=$(date +"%Y")
filename=`basename $BASH_SOURCE`

home() {
  clear
  echo "=========================================================================="
  echo "                         $filename"
  echo "=========================================================================="
  echo ""
  echo "BPTechNet $filename version $Current_Version"
  echo "Copyright (c) 2000-$Year BP Technology Network"
  echo ""
  echo "What type of top level domain will be used? "
  echo ""
  echo "1. Commercial"
  echo "2. Educational"
  echo "3. Networking"
  echo "4. Organizational"
  echo "9. Enter manually ..."
  echo ""
  echo "0. Quit"
  echo ""
  printf "Enter your choice: "
  read DECIDE
  echo ""
  if [ "$DECIDE" = "1" ] ; then
    DOMAIN="com" && start
  elif [ "$DECIDE" = "2" ] ; then
    DOMAIN="edu" && start
  elif [ "$DECIDE" = "3" ] ; then
    DOMAIN="net" && start
  elif [ "$DECIDE" = "4" ] ; then
    DOMAIN="org" && start
  elif [ "$DECIDE" = "9" ] ; then
    clear
    echo "=========================================================================="
    echo "                         $filename"
    echo "=========================================================================="
    echo ""
    echo "BPTechNet $filename version $Current_Version"
    echo "Copyright (c) 2000-$Year BP Technology Network"
    echo ""
    echo "What abbreviation of top level domain will be used? (i.e. 'int' for International)"
    echo ""
    read DOMAIN
    echo ""
    echo "Domain Abbreviation: $DOMAIN"
    echo ""
    read -p "Is this the correct domain abbreviation (Y/N)? "
    [[ ! $REPLY =~ ^[Yy]$ ]] && home
    start
  elif [ "$DECIDE" = "0" ] ; then
    clear
    exit
  else
    echo "Invalid choice: $DECIDE"
  fi
  echo ""
  echo "Press 'Ctrl C' or wait 5 seconds to continue...";
  sleep 5
  home
}

start() {
  clear
  echo "=========================================================================="
  echo "                         $filename"
  echo "=========================================================================="
  echo ""
  echo "BPTechNet $filename version $Current_Version"
  echo "Copyright (c) 2000-$Year BP Technology Network"
  echo ""
  echo ""
  printf "Enter the entity name: "
  read ENTITY
  echo ""
  echo "Entity Name: $ENTITY"
  echo ""
  read -p "Is this the correct entity (Y/N)? "
  [[ ! $REPLY =~ ^[Yy]$ ]] && start
  next
}

next() {
  clear
  echo "=========================================================================="
  echo "                         $filename"
  echo "=========================================================================="
  echo ""
  echo "BPTechNet $filename version $Current_Version"
  echo "Copyright (c) 2000-$Year BP Technology Network"
  echo ""
  echo ""
  printf "Enter the name of the project: "
  read PROJECT
  echo ""
  echo "Project Name: $PROJECT"
  echo ""
  read -p "Is this the correct PROJECT (Y/N)? "
  [[ ! $REPLY =~ ^[Yy]$ ]] && next
  create
}

create() {
  echo off
  clear
  echo "=========================================================================="
  echo "                         $filename"
  echo "=========================================================================="
  echo ""
  echo "BPTechNet $filename version $Current_Version"
  echo "Copyright (c) 2000-$Year BP Technology Network"
  echo ""
  echo "Creating the branches directories!..."
  mkdir "$HOME/GITRepositories"
  mkdir "$HOME/GITRepositories/$DOMAIN"
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY"
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT"
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/branches"
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/branches/develop"
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/branches/feature"
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/branches/hotfix"
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/branches/release"
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/branches/review"
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/branches/training"
  echo "Creating the tags directories!..."
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/tags"
  echo "Creating the trunk directories!..."
  mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/trunk"
}

if [ "$1" != "" ]; then
  DOMAIN="$1"
else
  home
fi

if [ "$2" != "" ]; then
  ENTITY="$2"
else
  start
fi

if [ "$3" != "" ]; then
  PROJECT="$3"
else
  next
fi

if [ "$4" != "" ]; then
  APPLICATION="$4"
  create
  # mkdir "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/trunk/$APPLICATION"
  cd "$HOME/GITRepositories/$DOMAIN/$ENTITY/$PROJECT/trunk"
  rails new $APPLICATION
else
  create
fi

echo "Done!"
echo "Press 'Ctrl C' or wait 5 seconds to continue...";
sleep 5
exit
