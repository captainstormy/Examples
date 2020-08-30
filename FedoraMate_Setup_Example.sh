#!/bin/bash
clear
################################################################################
# Written By: "Captain Stormy"
# Date: 08/30/2020
#===============================================================================
# Purpose:
#   This script is used to install my common software after a fresh install
#   of Fedora Mate Spin.
#
################################################################################

################################################################################
#   Define Variables
################################################################################
# Static Variables
origdir=`pwd`
TeamsVersion=teams-1.3.00.958-1.x86_64 #Lookup: https://packages.microsoft.com/yumrepos/ms-teams/

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
echo
echo "##########################################################################"
echo "# dnf Reminder"
echo "##########################################################################"
echo
echo "Add the following to /etc/dnf/dnf.conf"
echo
echo "fastestmirror=true"
echo "max_parallel_downloads=10"
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
echo "- dnf upgrade"
echo "--------------------------------------------------------------------------"
echo

sudo dnf upgrade;
check_exit_status;

#-------------------------------------------------------------------------------
#   Add RPM Fusion Repos
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- Add RPM Fusion Repos"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y;
echo
sudo dnf install rpmfusion-free-release-tainted -y;
echo
sudo dnf install rpmfusion-nonfree-release-tainted -y;
echo

#-------------------------------------------------------------------------------
#   Make sure system is up to date with RPM Fusion Repos in place.
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- dnf upgrade"
echo "--------------------------------------------------------------------------"
echo

sudo dnf upgrade;
check_exit_status;

#-------------------------------------------------------------------------------
#   Add software from Repos
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- Add software from Repos"
echo "--------------------------------------------------------------------------"
echo

echo "--------------------------------------------------------------------------"
echo "- Install Nvidia Driver"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install akmod-nvidia -y;
echo
sudo dnf install xorg-x11-drv-nvidia-cuda -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Multimedia stuff "
echo "--------------------------------------------------------------------------"
echo

sudo dnf groupupdate multimedia -y;
echo
sudo dnf groupupdate sound-and-video -y;
echo
sudo dnf install libdvdcss -y;
echo
sudo dnf install libaacs -y;
echo
sudo dnf install libbluray -y;
echo
sudo dnf install ffmpeg -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install firmware from nonfree tainted repos "
echo "--------------------------------------------------------------------------"
echo
sudo dnf install \*-firmware -y;
echo
echo "--------------------------------------------------------------------------"
echo "- Install chromium"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install chromium -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install additional archive types"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install unrar -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install libreoffice"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install libreoffice -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install gimp"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install gimp -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install vlc"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install vlc -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Thunderbird"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install handbrake -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install xscreensaver"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install xscreensaver -y;
echo
sudo dnf install xscreensaver-base -y;
echo
sudo dnf install xscreensaver-extras -y;
echo
sudo dnf install xscreensaver-extras-base -y;
echo
sudo dnf install xscreensaver-gl-base -y;
echo
sudo dnf install xscreensaver-gl-extras -y;
echo
sudo dnf install xscreensaver-extras-gss -y;
echo
sudo dnf install xscreensaver-gl-extras-gss -y;

echo "--------------------------------------------------------------------------"
echo "- Install neofetch"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install neofetch -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install xournalpp"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install xournalpp -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install hplip-gui"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install hplip-gui -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install steam"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install steam -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install htop"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install htop -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install nethogs"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install nethogs -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install git-cola"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install git-cola -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install aisleriot"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install aisleriot -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install gnome-mahjongg"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install gnome-mahjongg -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install gnome-mines"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install gnome-mines -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install snes9x-gtk"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install snes9x-gtk -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install pcsxr"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install pcsxr -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install tlp"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install tlp-rdw -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install brasero"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install brasero -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install caja-dropbox"
echo "--------------------------------------------------------------------------"
echo
sudo dnf install caja-dropbox -y
echo

echo "--------------------------------------------------------------------------"
echo "- Install Dropbox"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install dropbox -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Discord dependencies (For Discord)"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install libatomic -y;
echo
sudo dnf install GConf2 -y;
echo
sudo dnf install libappindicator -y;
echo
sudo dnf install libcxx -y;
echo
sudo dnf install libcxxabi -y;
echo
sudo dnf install libdbusmenu-gtk2 -y;
echo
sudo dnf install libindicator -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Discord"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install discord -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install numlockx"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install numlockx -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install qt5-qtstyleplugins"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install qt5-qtstyleplugins -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install mate-sensors-applet"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install mate-sensors-applet -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install mate-applet-softupd"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install mate-applet-softupd -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install pulseaudio-module-bluetooth-freeworld "
echo "--------------------------------------------------------------------------"
echo

sudo dnf install pulseaudio-module-bluetooth-freeworld --allowerasing -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install cura"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install cura -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install nextcloud-client"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install nextcloud-client -y;
sudo dnf install nextcloud-client-caja -y;
echo

#-------------------------------------------------------------------------------
#   Themes
#-------------------------------------------------------------------------------

echo "--------------------------------------------------------------------------"
echo "- Install Themes"
echo "--------------------------------------------------------------------------"
echo

sudo dnf install arc-theme -y;
echo
sudo dnf install gnome-themes -y;
echo
sudo dnf install gnome-colors-icon-theme -y;
echo
sudo dnf install gnome-icon-theme -y;
echo
sudo dnf install flat-remix-gtk3-theme -y;
echo
sudo dnf install flat-remix-icon-theme -y;
echo
sudo dnf install fedora-icon-theme -y;
echo
sudo dnf install mint-themes-gtk3-y;
echo
sudo dnf install numix-icon-theme -y;
echo
sudo dnf install nuvola-icon-theme -y;
echo
sudo dnf install paper-icon-theme -y;
echo
sudo dnf install numix-gtk-theme -y;
echo
sudo dnf install numix-icon-theme-circle -y;
echo
sudo dnf install numix-icon-theme-square -y;
echo

#-------------------------------------------------------------------------------
#   Add software from Third Parties
#-------------------------------------------------------------------------------

echo "--------------------------------------------------------------------------"
echo "- Add software from Third Parties"
echo "--------------------------------------------------------------------------"
echo

echo "--------------------------------------------------------------------------"
echo "- Install youtube-dl"
echo "--------------------------------------------------------------------------"
echo
sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl;
sudo chmod a+x /usr/local/bin/youtube-dl;
hash -r;

#Install youtube2mp3 script to /usr/local/bin"
sudo install youtube2mp3 /usr/local/bin;
echo

echo "--------------------------------------------------------------------------"
echo "- Install skype"
echo "--------------------------------------------------------------------------"
echo

wget -O ~/Downloads/skypeforlinux-64.rpm "https://go.skype.com/skypeforlinux-64.rpm";
echo
sudo dnf install ~/Downloads/skypeforlinux-64.rpm -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install zoom"
echo "--------------------------------------------------------------------------"
echo

wget -O ~/Downloads/zoom_x86_64.rpm "https://zoom.us/client/latest/zoom_x86_64.rpm";
echo
sudo dnf install ~/Downloads/zoom_x86_64.rpm -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Teams"
echo "--------------------------------------------------------------------------"
echo

wget -O ~/Downloads/teams.rpm "https://packages.microsoft.com/yumrepos/ms-teams/$TeamsVersion.rpm";
sudo dnf install ~/Downloads/teams.rpm -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Install Minecraft"
echo "--------------------------------------------------------------------------"
echo

wget -O ~/Downloads/Minecraft.tar.gz "https://launcher.mojang.com/download/Minecraft.tar.gz";
echo
mkdir -p ~/Applications;
echo
tar xvzf ~/Downloads/Minecraft.tar.gz -C ~/Applications;
echo

#-------------------------------------------------------------------------------
#   Remove flatpaks
#-------------------------------------------------------------------------------

echo "--------------------------------------------------------------------------"
echo "- Remove flatpaks"
echo "--------------------------------------------------------------------------"
echo

sudo dnf remove flatpak -y;
echo

#-------------------------------------------------------------------------------
#   Remove unwanted preinstalled software
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- Remove unwanted preinstalled software"
echo "--------------------------------------------------------------------------"
echo

echo "--------------------------------------------------------------------------"
echo "- Remove cura-lulzbot if it exists"
echo "--------------------------------------------------------------------------"
echo

sudo dnf remove cura-lulzbot -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove gnote if it exists"
echo "--------------------------------------------------------------------------"
echo

sudo dnf remove gnote -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove parole if it exists"
echo "--------------------------------------------------------------------------"
echo

sudo dnf remove parole -y;
echo

echo "--------------------------------------------------------------------------"
echo "- Remove xfburn if it exists"
echo "--------------------------------------------------------------------------"
echo

sudo dnf remove xfburn -y;
echo

#-------------------------------------------------------------------------------
#   Misc Section
#-------------------------------------------------------------------------------

echo "--------------------------------------------------------------------------"
echo "- Enable tlp Service"
echo "--------------------------------------------------------------------------"
echo

sudo systemctl enable tlp;
echo

echo "--------------------------------------------------------------------------"
echo "- register the nvidia kernel module with the ACPI subsystem"
echo "--------------------------------------------------------------------------"
echo

NVreg_RegisterForACPIEvents=1 NVreg_EnableMSI=1;
echo

echo "--------------------------------------------------------------------------"
echo "- tweaks for QT to USE GTK theme"
echo "--------------------------------------------------------------------------"
echo

sudo cp ./environment /etc/environment


echo "--------------------------------------------------------------------------"
echo "- Set Plymouth to Old School Text Boot"
echo "--------------------------------------------------------------------------"
echo
sudo plymouth-set-default-theme details -R
echo


#-------------------------------------------------------------------------------
#   Cleanup
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- Delete Downloaded .rpm files"
echo "--------------------------------------------------------------------------"
echo

sudo rm ~/Downloads/*.rpm;
echo

echo "--------------------------------------------------------------------------"
echo "- Delete Downloaded .tar.gz files"
echo "--------------------------------------------------------------------------"
echo

sudo rm ~/Downloads/*.tar.gz;
echo

echo "--------------------------------------------------------------------------"
echo "- dnf autoremove"
echo "--------------------------------------------------------------------------"
echo

sudo dnf autoremove -y;
check_exit_status

timestamp
reminder;

echo "##########################################################################"
echo "# Setup process ended by $USER on $now"
echo "##########################################################################"
echo
