{ pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./docker.nix
    ./gaming.nix
    ./gnome.nix
    ./home-manager.nix
  ];

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

  users.users.cethien = {
    isNormalUser = true;
    description = "cethien";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  services.xserver = {
    enable = true;

    xkb.layout = "de";
    xkb.variant = "nodeadkeys";

    excludePackages = [ pkgs.xterm ];
  };

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
  };

  services.ratbagd.enable = true;
  services.hardware.openrgb.enable = true;
}