#!/bin/bash
clear
################################################################################
# Written By: Brandon M Adkins aka "Captain Stormy"
# Date: 04/05/2019
#===============================================================================
# Purpose: 
#   This script updates  your system, and has an option to do a dist upgrade.
#
# Assumptions:  
#   This script Assumes you are running Ubuntu.
#
# Notes: 
#   This script was designed to be use on Ubuntu, but should work on and
#   .deb based system.  
#
################################################################################
################################################################################
#   Define Variables
################################################################################
# Static Variables
upgradedistro=0 # Value of 1 will perform distro upgrade.  Anything else won't.

# Dynamic Variables
now=$(date +'%m/%d/%Y %r')

################################################################################
#   Define Functions
################################################################################
timestamp()
{
    now=$(date +'%m/%d/%Y %r')
}

check_exit_status() 
{

    if [ $? -eq 0 ]
    then
        echo
        echo "Success"
        echo
    else
        echo
        echo "[ERROR] Process Failed!"
        echo
		
        read -p "The last command exited with an error. Exit script? (y/n) " ans

        if [ "$answer" == "y" ]
        then
            exit 1
        fi
    fi
}

greeting() 
{
    timestamp
    echo "#####################################################################"
    echo "# Update Started by $USER on $now"
    echo "#####################################################################"
    echo
}

update() 
{
    echo "---------------------------------------------------------------------"
    echo "- APT update"    
    echo "---------------------------------------------------------------------"
    echo

    sudo apt update;
    check_exit_status

    echo "---------------------------------------------------------------------"
    echo "- APT upgrade"    
    echo "---------------------------------------------------------------------"
    echo

    sudo apt upgrade -y;
    check_exit_status

    echo "---------------------------------------------------------------------"
    echo "- APT dist upgrade"    
    echo "---------------------------------------------------------------------"
    echo

    if [ "$upgradedistro" == 1 ] 
    then
        sudo apt dist-upgrade -y
        check_exit_status
    else
        echo "- Dist upgrade currently disabled"
        echo
    fi
}

youtubedl()
{
    echo "---------------------------------------------------------------------"
    echo "- Update youtube-dl"    
    echo "---------------------------------------------------------------------"
    echo
    sudo youtube-dl -U;
    echo
}

cleanup() 
{

    echo "---------------------------------------------------------------------"
    echo "- APT autoremove"    
    echo "---------------------------------------------------------------------"
    echo

    sudo apt autoremove --purge -y;
    check_exit_status

    echo "---------------------------------------------------------------------"
    echo "- APT clean"    
    echo "---------------------------------------------------------------------"
    echo

    sudo du -sh /var/cache/apt/archives
    echo
    sudo apt autoclean -y;
    sudo apt clean;
    echo
    sudo du -sh /var/cache/apt/archives
    echo

    check_exit_status

    echo "---------------------------------------------------------------------"
    echo "- updatedb"    
    echo "---------------------------------------------------------------------"

    sudo updatedb;
    check_exit_status
}

leave() 
{
    timestamp
    echo "#####################################################################"
    echo "# Update completed by $USER on $now"
    echo "#####################################################################"
    echo
}

status()
{
    echo "---------------------------------------------------------------------"
    echo "- ubuntu-support-status"    
    echo "---------------------------------------------------------------------"
    echo

    ubuntu-support-status;
    echo
}

################################################################################
#   Main Processing
################################################################################
greeting;
update;
youtubedl;
cleanup;
status;
leave;
