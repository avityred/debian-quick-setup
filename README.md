# Debian Quick Set-up
### A script to automate the Debian set up proccess.
##### Made for Linux Newcomers, or just lazy folks.

# How-to
#### Step 1:
Clone the repository using:
```
git clone https://github.com/avityred/debian-quick-setup.git
```
##### or
install the setup files through the releases tab.

#### Step 2:
Open the directory in which the file is located at
```
cd [directory]
```
##### Then
Run:
```
sudo sh ./setup.sh
```

### And continue through with the script.

# NoSudo.md

## If you are not using debian, but a debian/ubuntu based distro, you won't have to do this.

If you don't have sudo access then follow this guide.

Debian by itself does not give the default user sudo access.
So what you will have to do is:

Open a terminal, and type in:
## su ##
Then, 
type in:
## sudo usermod -a -G sudo $username ##
(Replace $username with your username.)
Then exit and log out and back in.

Now you are ready to run the setup.sh script.
