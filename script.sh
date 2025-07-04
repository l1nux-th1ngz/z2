
#!/bin/bash

# Make scripts executable
chmod +x polkit.sh display.sh tools.sh pre-install.sh winmans.sh network.sh gtk.sh /BackUps/mvit.sh webbrowsers.sh lightdm.sh

# Execute scripts sequentially
./polkit.sh
wait

./display.sh
wait

./tools.sh
wait

./pre-install.sh
wait

./winmans.sh
wait

./network.sh
wait

./gtk.sh
wait

./BackUps/mvit.sh
wait

./webbrowsers.sh
wait

./lightdm.sh
wait

# Update package list
sudo apt-get update
