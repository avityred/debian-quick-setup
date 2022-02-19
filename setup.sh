sudo apt install neofetch
clear

# Enable non-free repositories

echo "Do you want to enable non-free repositories? (y/n)"
read nonfree

if [ $nonfree = "y" ]
then
    echo "Enabling non-free repos."
    sudo apt-add-repository non-free
    sudo apt update
    echo "Done."
fi

# Add 32-bit architecture

clear
echo "Enabling 32-bit support."
sudo dpkg --add-architecture i386
sudo apt update

# Install apps

clear
echo "Are there any extra apps you would like to install? (y/n)"
read appsan

if [ $appsan = "y" ]
then
    clear
    echo "What apps do you want to install?"
    read apps
    echo "Installing apps."
    sudo apt install $apps
    clear
    echo "Finished."
fi

clear
echo "Do you want to install a GUI software store? (y/n)"
read softstore

if [ $softstore = "y" ]
then
    sudo apt install gnome-software
    clear
fi

clear
echo "Do you want to add support for flatpak? (y/n)"
read flatpak

if [ $flatpak = "y" ]
then
    sudo apt install flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    clear

    if [ $softstore = "y" ]
    then
        sudo apt install gnome-software-plugin-flatpak
        clear
    fi

fi
# Drivers

clear
echo "Do you want to install GPU Drivers? (y/n)"
read answer

if [ $answer = "y" ]
then
    sleep 0.3
    echo "Which GPU drivers do you want to install? AMD(1) or NVIDIA(2)"
    read answerg
    
    if [ $answerg = "1" ]
    then
        echo "Installing AMDGPU drivers."
        sudo apt update
        sudo apt install firmware-amd-graphics libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all
        sudo apt update
        clear
        echo "Drivers successfully installed."
    fi
    
    if [ $answerg = "2" ]
    then
        echo "Installing NVIDIA drivers."
        sudo apt update
        sudo apt install nvidia-driver firmware-misc-nonfree
        sudo apt update
        clear
        echo "Drivers successfully installed."
    fi

fi

# Clone and install themes

clear
echo "Do you want to install themes? (y/n)"
read themes

if [ $themes = "y" ]
then

    echo "Do you want to install the premade theme pack? (y/n)"
    read themechoose

    if [ $themechoose = "1" ]
    then
        git clone https://github.com/alvatip/Nordzy-cursors.git && git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git && git clone https://github.com/vinceliuice/Colloid-gtk-theme.git && git clone https://github.com/vinceliuice/Colloid-icon-theme.git
        cd Nordzy-cursors
        ./install.sh
        cd ..

        cd WhiteSur-gtk-theme
        ./install.sh
        cd ..

        cd Colloid-gtk-theme
        ./install.sh
        cd ..

        cd Colloid-icon-theme
        ./install.sh
        cd ..

        clear
        rm -r Nordzy-cursors WhiteSur-gtk-theme Colloid-gtk-theme Colloid-icon-theme
    fi
fi

# Update system

echo "Running system upgrade."
sudo apt upgrade
clear

# Finished

neofetch
echo "Set-up finished."
echo "PC Restart recommended."