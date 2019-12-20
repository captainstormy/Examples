#!/bin/bash
clear
################################################################################
#===============================================================================
# Purpose: 
#   This script is used to install my common software after a new install
#	and make automated config changes as needed.
#
# Notes: 
#   This script was designed to be used on Ubuntu.  
#
# Assumptions:
#   We are installing Ubuntu Mate.
#
################################################################################

################################################################################
#   Define Variables
################################################################################
# Static Variables
origdir=`pwd`
DropboxVersion=dropbox_2019.02.14_amd64 #Lookup: https://linux.dropbox.com/packages/ubuntu/

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

        if [ "$ans" == "y" ]
        then
            exit 1
        fi
    fi
}

reminder()
{
echo "##########################################################################"
echo "# fstab Reminder"
echo "##########################################################################"
echo
echo "Add the following to all ssd entries on /etc/fstab:"
echo ",noatime,nodiratime,discard"
echo
echo "Add the following at the end of /etc/fstab:"
echo "#mount /tmp to ram"
echo "tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0"
echo "#Mount SteamDrive"
echo "UUID=6c3cfa06-c72e-4e60-be6a-9831ce203845 /media/captainstormy/SteamDrive   ext4    defaults,noatime,nodiratime,discard    0   3"
echo
echo
}

################################################################################
#   Main Processing
################################################################################
timestamp

echo "##########################################################################"
echo "# Setup process started by $USER on $now"
echo "##########################################################################"
echo

#-------------------------------------------------------------------------------
#   Make sure base system is up to date first.
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- APT update"    
echo "--------------------------------------------------------------------------"
echo

sudo apt update;
check_exit_status;

echo "--------------------------------------------------------------------------"
echo "- APT upgrade"    
echo "--------------------------------------------------------------------------"
echo

sudo apt upgrade -y;
check_exit_status;

#-------------------------------------------------------------------------------
#   Root Password
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- Root Password Selection"    
echo "--------------------------------------------------------------------------"
echo

read -p "Do you want to set a new root password? (y/n) " rootanswer
echo

if [ "$rootanswer" == "y" ]
then   
    echo "- Setting new Root password "   
    echo
    sudo passwd root
else
    echo "- Skipping Root password "  
fi
echo

#-------------------------------------------------------------------------------
#   Add software from Repos
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- Add software from Repos"    
echo "--------------------------------------------------------------------------"
echo

echo "--------------------------------------------------------------------------"
echo "- Install synaptic"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install synaptic -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install gparted"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install gparted -y;
echo 

echo "--------------------------------------------------------------------------"
echo "- Install curl"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install curl -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install ubuntu-restricted-addons"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install ubuntu-restricted-addons -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install ubuntu-restricted-extras"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install ubuntu-restricted-extras -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install simple-scan"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install simple-scan -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install libreoffice"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install libreoffice -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install filezilla"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install filezilla -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install gimp"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install gimp -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install firefox"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install firefox -y;
echo


echo "--------------------------------------------------------------------------"
echo "- Install vlc"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install vlc -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install DVD Playback Libs"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install libdvd-pkg -y;
echo
sudo dpkg-reconfigure libdvd-pkg;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Blu-Ray Playback Libs"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install libaacs0 libbluray-bdj libbluray2 -y;
echo
sudo mkdir -p ~/.config/aacs/;
echo
sudo wget -O ~/.config/aacs/KEYDB.cfg "http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg";
echo

echo "--------------------------------------------------------------------------"
echo "- Install Thunderbird"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install thunderbird -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Handbrake"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install handbrake -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Screensavers"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install xscreensaver-data-extra xscreensaver-gl-extra -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install neofetch"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install neofetch -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install xournal"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install xournal -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install hplip-gui"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install hplip-gui -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install steam"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install steam -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install triplea"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install triplea -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install git-cola"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install git-cola -y;
echo

#git config settings
git config --global user.email "Emails Address changed for Example Script"
git config --global user.name "Name changed for Example Script"

echo "--------------------------------------------------------------------------"
echo "- Install aisleriot"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install aisleriot -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install gnome-mahjongg"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install gnome-mahjongg -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install gnome-mines"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install gnome-mines -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install dopewars"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install dopewars -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install higan"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install higan -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install pcsxr"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install pcsxr -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Caffeine"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install Caffeine -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install tlp"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install tlp -y;
echo

#-------------------------------------------------------------------------------
#   Add software from Third Parties
#-------------------------------------------------------------------------------

echo "--------------------------------------------------------------------------"
echo "- Install dropbox"    
echo "--------------------------------------------------------------------------"
echo
echo "- Install caja-dropbox "    
echo
sudo apt install caja-dropbox -y
echo

echo "--------------------------------------------------------------------------"
echo "- Add software from Third Parties"    
echo "--------------------------------------------------------------------------"
echo

echo "--------------------------------------------------------------------------"
echo "- Install youtube-dl"    
echo "--------------------------------------------------------------------------"
echo
#Version in repos is hella outdated
sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl;
sudo chmod a+x /usr/local/bin/youtube-dl;
hash -r;

echo "- Install ffmpeg "    
echo
sudo apt install ffmpeg -y
echo

#Install youtube2mp3 script to /usr/local/bin"   
sudo install youtube2mp3 /usr/local/bin;
echo

echo "--------------------------------------------------------------------------"
echo "- Install skype"    
echo "--------------------------------------------------------------------------"
echo

wget -O ~/Downloads/skypeforlinux-64.deb "https://go.skype.com/skypeforlinux-64.deb";
sudo apt install ~/Downloads/skypeforlinux-64.deb -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install discord"    
echo "--------------------------------------------------------------------------"
echo

wget -O ~/Downloads/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb";
sudo apt install ~/Downloads/discord.deb -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install minecraft"    
echo "--------------------------------------------------------------------------"
echo

wget -O ~/Downloads/Minecraft.deb "https://launcher.mojang.com/download/Minecraft.deb";
sudo apt install ~/Downloads/Minecraft.deb -y;
echo

#echo "--------------------------------------------------------------------------"
#echo "- Install Google Chrome"    
#echo "--------------------------------------------------------------------------"
#echo

#wget -O ~/Downloads/google-chrome-stable_current_amd64.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb";
#sudo apt install ~/Downloads/google-chrome-stable_current_amd64.deb -y;
#echo    

echo "--------------------------------------------------------------------------"
echo "- Install Dropbox"    
echo "--------------------------------------------------------------------------"
echo

sudo apt install python3-gpg -y;
echo

wget -O ~/Downloads/dropbox.deb "https://linux.dropbox.com/packages/ubuntu/$DropboxVersion.deb";
sudo apt install ~/Downloads/dropbox.deb -y;
echo  

#-------------------------------------------------------------------------------
#   This section is only needed for System76 PCs
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- Install System76 PPA and Driver"    
echo "--------------------------------------------------------------------------"
echo

read -p "Need to install System76 PPA and Driver? (y/n) " answer
echo

if [ "$answer" == "y" ]
then   
    sudo apt-add-repository -y ppa:system76-dev/stable
    sudo apt-get update
    sudo apt-get install -y system76-driver
else
    echo "System76 PPA and Driver install skipped."
fi
echo

#-------------------------------------------------------------------------------
#   Disable Power Saving turning off the Sound Card
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- Turn off Power saving for Sound Card"    
echo "--------------------------------------------------------------------------"
echo

read -p "Turn off Power Saving for Sound Card? (y/n) " answer
echo

if [ "$answer" == "y" ]
then   
    sudo cp ~/Documents/Scripts/BashScripts/AudioFix/audio_disable_powersave.conf /etc/modprobe.d
    sudo cp ~/Documents/Scripts/BashScripts/AudioFix/power_save /sys/module/snd_hda_intel/parameters
    sudo cp ~/Documents/Scripts/BashScripts/AudioFix/power_save_controller /sys/module/snd_hda_intel/parameters
else
    echo "Leaving Sound Card Power Saving alone."
fi
echo

#-------------------------------------------------------------------------------
#   Add Terminal Themes
#-------------------------------------------------------------------------------

xdg-open https://mayccoll.github.io/Gogh/;

bash -c  "$(wget -qO- https://git.io/vQgMr)" 

#-------------------------------------------------------------------------------
#   Remove unwanted preinstalled software
#-------------------------------------------------------------------------------

#I could do this section by DE, but I'm just brute forcing this incase defaults change in the future
echo "--------------------------------------------------------------------------"
echo "- Remove unwanted preinstalled software"    
echo "--------------------------------------------------------------------------"
echo

echo "--------------------------------------------------------------------------"
echo "- Remove mpv if it exists"    
echo "--------------------------------------------------------------------------"
echo

sudo apt remove mpv -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove rhythmbox if it exists"    
echo "--------------------------------------------------------------------------"
echo

sudo apt remove rhythmbox -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove evolution if it exists"    
echo "--------------------------------------------------------------------------"
echo

sudo apt remove evolution -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove cheese"    
echo "--------------------------------------------------------------------------"
echo

sudo apt remove cheese -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove ubuntu-mate-welcome"    
echo "--------------------------------------------------------------------------"
echo

sudo snap remove ubuntu-mate-welcome;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove software-boutique"    
echo "--------------------------------------------------------------------------"
echo

sudo snap remove software-boutique;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove deja-dup if it exists"    
echo "--------------------------------------------------------------------------"
echo

sudo apt remove deja-dup -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove gnome-mpv if it exists"    
echo "--------------------------------------------------------------------------"
echo

sudo apt remove gnome-mpv -y;
echo

#-------------------------------------------------------------------------------
#   Cleanup
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- APT autoremove"    
echo "--------------------------------------------------------------------------"
echo

sudo apt autoremove --purge -y;
check_exit_status

echo "--------------------------------------------------------------------------"
echo "- APT clean"    
echo "--------------------------------------------------------------------------"
echo

sudo du -sh /var/cache/apt/archives
echo
sudo apt autoclean -y;
sudo apt clean;
echo
sudo du -sh /var/cache/apt/archives
echo

check_exit_status

echo "--------------------------------------------------------------------------"
echo "- Check Support Status"    
echo "--------------------------------------------------------------------------"
ubuntu-support-status
echo

timestamp

echo "##########################################################################"
echo "# Setup process ended by $USER on $now"
echo "##########################################################################"
echo

reminder;