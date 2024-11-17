{ config, pkgs, ... }:

{
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
}
