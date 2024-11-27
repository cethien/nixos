{ pkgs,... }:

{
  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
  };

  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-music
    gnome-text-editor
    epiphany # web browser
    yelp # help
    seahorse # password manager
  ]);

  environment.systemPackages = with pkgs; [
    gnome-tweaks

    sushi # gnome file manager previewer
    decibels # gnome audio player
    video-trimmer # gnome video editor
    pika-backup # gnome backup tool
    drawing # gnome image editor
  ] ++ [
    roboto
    open-sans
    (nerdfonts.override { fonts = [ "FiraCode" "CodeNewRoman" ]; })
  ] ++ (with pkgs.gnomeExtensions; [
    legacy-gtk3-theme-scheme-auto-switcher
    tweaks-in-system-menu
    quick-settings-audio-devices-hider
    quick-settings-audio-panel
    bluetooth-battery-meter
    system-monitor
    appindicator
    do-not-disturb-while-screen-sharing-or-recording
    blur-my-shell
    spotify-controls
    docker
    tiling-shell
  ]);

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}