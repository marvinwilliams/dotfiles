cd /tmp/dotfiles/
if ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime; then
    printf "Setting timezone and clock...Done\n"
else
    printf "Setting timezone...Failed!\n"
    exit
fi
hwclock --systohc
printf "Installing core programs and fonts..."
if sudo pacman --noconfirm -S adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts alsa-utils asp cmake compton cronie cups cups-pdf curl dosfstools feh grub gutenprint htop vim ntfs-3g openssh os-prober tmux ttf-dejavu ttf-font-awesome unzip wget xf86-video-ati xorg-server xorg-xinit xorg-xrandr xorg-xsetroot zsh > /dev/null; then
    printf "Done\n"
else
    printf "Failed!\n"
    exit
fi
printf "Downloading and installing neo-layout...\n"
wget "https://svn.neo-layout.org/linux/console/neo.map"
mkdir /usr/share/kbd/keymaps/i386/neo
cp neo.map /usr/share/kbd/keymaps/i368/
localectl --no-convert set-keymap neo
printf "Copying system files...\n"
for f in *; do
    if [[ -d $f ]]; then
	cp --parents -r $f/* /$f/
    fi
done
printf "Generating locale...\n"
locale-gen
printf "Creating initramfs..."
if mkinitcpio -p linux > /dev/null; then
    printf "Done\n"
else
    printf "Failed!\n"
    exit
fi
printf "Installing grub...\n"
if grub-install --target=i386-pc /dev/sdb; then
    if grub-mkconfig -o /boot/grub/grub.cfg; then
	printf "Done\n"
    else
	printf "Failed!\n"
	exit
else
    printf "Failed!\n"
    exit
fi
printf "Script done.\nSet root password to 'password'\n"
echo "password" | chpasswd
