{ ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.xpadneo.enable = true;

  programs = {
    steam.enable = true;
    steam.gamescopeSession.enable = true;

    gamemode.enable = true;
  };
}