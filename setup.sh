# Add 32-bit architecture

sudo dpkg --add-architecture i386

# Install apps

sudo apt install steam neofetch discord terminology

# Clone and install themes

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
cd Repos

neofetch
echo "Set-up finished."