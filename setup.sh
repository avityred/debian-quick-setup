# Enable non-free repositories

echo "Do you want to enable non-free repositories? (y/n)"
read nonfree

if [ nonfree = y ]
then
    echo "Enabling non-free repos."
    sudo apt-add-repository non-free
    echo "Done."
fi

# Add 32-bit architecture

sudo dpkg --add-architecture i386

# Install apps

echo "Are there any extra apps you would like to install? (y/n)"
read appsan

if [ appsan = y ]
then
    echo "What apps do you want to install? (Must be available in the repos.)"
    read apps
    echo "Installing apps."
    sudo apt install $apps
    echo "Finished."
fi

# Drivers

echo "Do you want to also install GPU Drivers? (y/n)"
read answer

if [ answer = y ]
then
    echo "Which GPU drivers do you want to install? AMD(1) or NVIDIA(2)"
    read answerg
    
    if [ answerg = 1 ]
    then
        echo "Installing AMDGPU drivers."
        sudo apt update
        sudo apt install firmware-amd-graphics libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all
        sudo apt update
        echo "Drivers successfully installed."
    fi
    
    if [ answerg = 2 ]
    then
        echo "Installing NVIDIA drivers."
        sudo apt update
        sudo apt install nvidia-driver firmware-misc-nonfree
        sudo apt update
        echo "Drivers successfully installed."
    fi

fi

# Clone and install themes

echo "Do you want to install some themes? (y/n)"
read themes

if [ themes = y ]
then
    git clone https://github.com/alvatip/Nordzy-cursors.git && git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git && git clone https://github.com/vinceliuice/Colloid-gtk-theme.git && git clone https://github.com/vinceliuice/Colloid-icon-theme.git
    cd Nordzy-cursors
    ./install.sh
    cd ..
    rmdir -r Nordzy-cursors

    cd WhiteSur-gtk-theme
    ./install.sh
    cd ..
    rmdir -r WhiteSur-gtk-theme

    cd Colloid-gtk-theme
    ./install.sh
    cd ..
    rmdir -r Colloid-gtk-theme

    cd Colloid-icon-theme
    ./install.sh
    cd ..
    rmdir -r Colloid-icon-theme

    cd Repos
fi

# Update system

echo "Running system upgrade."
sudo apt upgrade

# Finished

neofetch
echo "Set-up finished."
echo "We recommend you restart your PC."