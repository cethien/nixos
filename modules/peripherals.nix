{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  services.hardware.openrgb.enable = true;

  hardware.xpadneo.enable = true;

  environment.systemPackages = with pkgs; [
      solaar # logitech
      
      streamcontroller # streamdeck
      gnomeExtensions.streamcontroller-integration
  ];

  # programs.streamdeck-ui = {
  #   enable = true;
  #   autoStart = true;
  # };
}