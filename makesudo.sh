echo "Use this script if you don't have sudo permissions."

sleep 1

echo "Proceed? (y/n)"
read proc

if [ $proc = "y" ]
then 
    echo "Enter the name of the user you want to give sudo access to."
    read user
    sleep 0.5
    clear
    echo "Giving sudo permissions to user $user."
    sleep 0.3
    clear
    echo "Giving sudo permissions to user $user.."
    sleep 0.3
    clear
    echo "Giving sudo permissions to user $user..."
    sleep 0.1
    sudo usermod -a -G sudo $user
    echo "Finished, please reboot your system."
    exit
fi