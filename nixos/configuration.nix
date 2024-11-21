{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;


  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "pc-cethien";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  console.keyMap = "de-latin1-nodeadkeys";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.xpadneo.enable = true;

  users.users.cethien = {
    isNormalUser = true;
    description = "cethien";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  services.xserver = {
    xkb.layout = "de";
    xkb.variant = "nodeadkeys";
  };

  services.xserver.enable = true;

  # GNOME
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    gnome-characters
  ]);

  programs = {
    steam.enable = true;
    steam.gamescopeSession.enable = true;

    gamemode.enable = true;
  };

  services.ratbagd.enable = true;
  services.hardware.openrgb.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager

    gnome-tweaks

    gnomeExtensions.legacy-gtk3-theme-scheme-auto-switcher
    gnomeExtensions.tweaks-in-system-menu
    gnomeExtensions.quick-settings-audio-devices-hider
    gnomeExtensions.quick-settings-audio-panel
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.system-monitor
    gnomeExtensions.appindicator
    gnomeExtensions.do-not-disturb-while-screen-sharing-or-recording

    gnomeExtensions.spotify-controls
    gnomeExtensions.docker

    piper
  ];

  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
