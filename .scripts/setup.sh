cd /dotfiles
printf "Make sure partitions are properly created, formatted and mounted!\n"
printf "Set current time..."
timedatectl set-ntp true
printf "Done\n"
printf "Generating mirrorlist..."
if curl "https://www.archlinux.org/mirrorlist/?country=DE&protocol=http&protocol=https&ip_version=4&ip_version=6" > mirrorlist; then
    set -i 's/^#Server/Server' mirrorlist
    cp mirrorlist /etc/pacman.d/
    printf "Done\n"
else
    printf "Failed!\n"
    exit
fi
printf "Updating system..."
if sudo pacman --noconfirm -Syu > /dev/null; then
    printf "Done\n"
else
    printf "Failed!\n"
    exit
fi
printf "Installing base packages...\n"
if pacstrap /mnt base base-devel >/dev/null; then
    printf "Done\n"
else
    printf "Failed!\n"
    exit
fi
genfstab -L /mnt >> /mnt/etc/fstab
printf "Generating fstab...Done\n"
mkdir /mnt/tmp/dotfiles
cp -r --parents ./* /mnt/tmp/dotfiles
printf "Entering chroot...\n"
arch-chroot /mnt /tmp/dotfiles/.scripts/setup2.sh
