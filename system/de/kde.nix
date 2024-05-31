{ ... }: {
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "plasmax11";
  services.desktopManager.plasma6.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };

  programs.dconf.enable = true;
}
