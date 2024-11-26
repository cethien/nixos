{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  services.hardware.openrgb.enable = true;

  hardware.xpadneo.enable = true;

  environment.systemPackages = with pkgs; [
      solaar # logitech
      boatswain # elgato steam deck
  ];
}