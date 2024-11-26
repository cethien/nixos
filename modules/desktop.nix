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
    sushi # gnome file manager previewer
    gnome-tweaks
    decibels
    video-trimmer
    errands
    pika-backup
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}