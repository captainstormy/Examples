#!/bin/bash
clear

################################################################################
#   Main Processing
################################################################################
echo "--------------------------------------------------------------------------"
echo "- Install discord"
echo "--------------------------------------------------------------------------"
echo

wget -O ~/Downloads/discord.tar.gz "https://discordapp.com/api/download?platform=linux&format=tar.gz";
echo
mkdir -p ~/Applications;
echo
tar xvzf ~/Downloads/discord.tar.gz -C ~/Applications;
echo
sudo ~/Applications/Discord/postinst.sh
echo


#-------------------------------------------------------------------------------
#   Cleanup
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- Delete Downloaded .tar.gz files"
echo "--------------------------------------------------------------------------"
echo

sudo rm ~/Downloads/*.tar.gz;
echo
