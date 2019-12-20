#!/bin/bash
clear
################################################################################
# Written By: Brandon M Adkins aka "Captain Stormy"
# Date: 10/18/2019
#===============================================================================
# Purpose: 
#   Audio defaults never stay like I want them in pulse.  This script sets them
#   and then plays my custom boot sound.  
#
################################################################################

################################################################################
#   Define Variables
################################################################################
# Static Variables

# Dynamic Variables

################################################################################
#   Define Functions
################################################################################

################################################################################
#   Main Processing
################################################################################

#-- Set Output, Pulse usually outputs to HDMI
pactl set-default-sink 'alsa_output.pci-0000_00_1f.3.analog-stereo';

#-- Set Input
pactl set-default-source 'alsa_input.pci-0000_00_1f.3.analog-stereo';

#-- Set Volume
pactl set-sink-volume 1 100%

#-- Play boot sound
paplay /home/captainstormy/Music/System_Sounds/I_thought_you_GNU.ogg;

#-- Start Nextcloud
/home/captainstormy/AppImages/Nextcloud.AppImage;
