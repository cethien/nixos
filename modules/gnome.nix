{ pkgs,... }:

{
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-music
    epiphany # web browser
    totem # video player
    yelp # help
    seahorse # password manager
  ]);

  environment.systemPackages = with pkgs; [
    sushi # gnome file manager previewer
    gnome-tweaks
  ];

}