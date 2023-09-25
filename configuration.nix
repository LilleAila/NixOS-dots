# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nb_NO.UTF-8";
    LC_IDENTIFICATION = "nb_NO.UTF-8";
    LC_MEASUREMENT = "nb_NO.UTF-8";
    LC_MONETARY = "nb_NO.UTF-8";
    LC_NAME = "nb_NO.UTF-8";
    LC_NUMERIC = "nb_NO.UTF-8";
    LC_PAPER = "nb_NO.UTF-8";
    LC_TELEPHONE = "nb_NO.UTF-8";
    LC_TIME = "nb_NO.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "no";
    xkbVariant = "";
    enable = true;
    displayManager.sddm.enable = true;
    # videoDrivers = [ "intel" ];
  };

  # Configure console keymap
  console.keyMap = "no";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.olai = {
    isNormalUser = true;
    description = "Olai Solsvik";
    extraGroups = [ "networkmanager" "wheel" "video" "kvm" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Window manager
    wlroots
    hyprland
    hyprpaper
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    gtk3
    sddm
    seatd
    wlogout
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xdg-utils
    waybar
    swaylock-effects
    swaynotificationcenter
    papirus-icon-theme
    pipewire
    pavucontrol
    pam
    libnotify
    gnome.gnome-keyring

    # Desktop tools
    qt5ct
    # rofi-wayland
    tofi
    wl-clipboard
    wl-color-picker
    volantes-cursors
    networkmanagerapplet
    lxappearance
    imagemagick
    hyprpicker
    eww
    brightnessctl
    blueman

    # GUI apps
    kitty
    gparted
    gnome.dconf-editor
    firefox-wayland
    dolphin

    # Terminal utilities
    wget
    unzip
    neofetch
    cowsay
    killall
    git
    gamemode
    btop
    vim
    
    # Other
    virt-viewer
    qemu_kvm
    libvirt
    libsecret
    ydotool
    yad
    trash-cli
    tldr
    silver-searcher
    slurp
    scrot
    ripgrep
    pkg-config
    polkit_gnome
    ninja
    meson
    mpv
    lsd
    jp2a
    hugo
    brillo
    hplip
    gnumake
    glibc
    grim
    gcolor2
    fzf
    fontpreview
    cmake

    # Programming
    rustup
    cargo
    python311
    python311Packages.pip
    neovim
    gcc

    alsa-lib
    alsaLib
    alsa-utils
    alsaUtils
    # libpulseaudio
    udev

  #   vim
  #   alacritty
  #   brave
  #   btop
  #   blueman
  #   brightnessctl
  #   brillo
  #   cargo
  #   cmake
  #   emacs
  #   eww
  # #  discord
  #   dolphin
  #   firefox-wayland
  #   flameshot
  #   foot
  #   fontpreview
  #   fzf
  #   gamemode
  #   gcc
  #   gcolor2
  #   gimp
  #   git
  #   grim
  #   glibc
  #   gnome.dconf-editor
  #   gnome.gnome-keyring
  #   gnumake
  #   gparted
  #   gtk3
  #   hplip
  #   hugo
  #   hyprland
  #   hyprpaper
  #   hyprpicker
  #   imagemagick
  #   jp2a
  #   killall
  #   kitty
  #   libsecret
  #   libvirt
  #   libnotify
  #   lsd
  #   lxappearance
  #   mailspring
  #   meson
  #   mpv
  #   neofetch
  #   neovim
  #   ninja
  #   networkmanagerapplet
  #   pam
  #   pavucontrol
  #   papirus-icon-theme
  #   pipewire
  #   pkg-config
  #   polkit_gnome
  #   python311
  #   python311Packages.pip
  #   qemu_kvm
  #   qt5ct
  #   qt5.qtwayland
  #   qt6.qmake
  #   qt6.qtwayland
  #   ranger
  #   ripgrep
  #   rofi-wayland
  #   rustup
  #   scrot
  #   sddm
  #   seatd
  #   slurp
  #   silver-searcher
  #   simplescreenrecorder
  #   swaynotificationcenter
  #   # swaylock
  #   swaylock-effects
  #   tldr
  #   tofi
  #   trash-cli
  #   unzip
  #   virt-viewer
  #   volantes-cursors
  #   waybar
  #   wget
  #   wl-color-picker
  #   wlogout
  #   wofi
  #   wlroots
  #   wl-clipboard
  #   xdg-desktop-portal-hyprland
  #   xdg-desktop-portal-gtk
  #   # xdg-desktop-portal-wlr
  #   xdg-utils
  #   yad
  #   ydotool
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  programs.hyprland.enable = true;
  programs.hyprland.xwayland = {
    hidpi = false;
    enable = true;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-escpr ];
    browsing = true;
    defaultShared = true;
  };

  services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true;

  sound.enable = true;
  hardware = {
    bluetooth.enable = true;
  #  pulseaudio.enable = false;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.xserver.libinput.enable = true;

  # services.locate = {
  #   enable = true;
  #   locate = pkgs.mlocate;
  # };

  # qt.platformTheme = "qt5ct";

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  #  QT_QPA_PLATFORM = "xcb obs";
  #  QT_QPA_PLATFORM = "wayland";
  };

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    nerdfonts
    font-awesome
    google-fonts
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      # pkgs.xdg-desktop-portal-wlr
    ];
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
}
