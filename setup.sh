if ! command -v neofetch &> /dev/null
then
    sudo apt install neofetch
fi

clear

# Errors

inputError="Wrong input detected, please try again."

# Enable non-free repositories

echo "Do you want to enable non-free repositories? (y/n)"
read nonfree

if [ $nonfree = "y" ]
then
    echo "Enabling non-free repos."
    sudo apt-add-repository non-free
    sudo apt update
    echo "Done."
elif [ $nonfree = "n" ]
then
    echo "Skipping non-free repositories."
    sleep 0.2
else
    echo $inputError
fi

# Add 32-bit architecture

clear

echo "Do you want to enable 32-bit architecture support. (Recommended) (y/n)"
read archt

if [ $archt = "y" ]
then
    echo "Enabling 32-bit support."
    sudo dpkg --add-architecture i386
    sudo apt update
elif [ $archt = "n" ]
then
    echo "Skipping 32-bit architecture support."
else
    echo $inputError
fi

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
elif [ $appsan = "n" ]
then
    sleep 0.2
else
    echo $inputError
fi

clear
echo "Do you want to install a GUI software store? (y/n)"
read softstore

if [ $softstore = "y" ]
then
    sudo apt install gnome-software
    clear
elif [ $software = "n" ]
then
    echo "Skipping software store."
else
    echo $inputError
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
elif [ $flatpak = "n" ]
then
    sleep 0.2
else
    echo $inputError
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
    elif [ $answerg = "2" ]
    then
        echo "Installing NVIDIA drivers."
        sudo apt update
        sudo apt install nvidia-driver firmware-misc-nonfree
        sudo apt update
        clear
        echo "Drivers successfully installed."
    else
        echo $inputError
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

    if [ $themechoose = "y" ]
    then

        if ! command -v git &> /dev/null
        then
            echo "git could not be found, installing."
            sudo apt install git
            clear
        fi

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
    elif [ $themechoose = "n" ]
    then
        sleep 0.2
    else
        echo $inputError
    fi
elif [ $themes = "n" ]
then
    echo "Skipping themes."
else
    echo $inputError
fi

# Update system

echo "Running system upgrade."
sudo apt upgrade
clear

# Finished

neofetch
echo "Set-up finished."
if [ $answer = "y" ] | [ $flatpak = "y" ] | [ $softstore = "y" ]
then
    echo "PC Restart recommended."
fi