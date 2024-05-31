{ pkgs, lib, host, ... }: {
  config = {
    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Set GDM text scaling to match our GNOME scaling preference.
    # TODO - Move to scale-factor once all our programs supports fractional scaling.
    programs.dconf.profiles.gdm.databases =
      let scale = if host == "rannoch" then 1.5 else 1.25;
      in [{
        settings."org/gnome/desktop/interface".text-scaling-factor =
          lib.gvariant.mkDouble scale;
      }];

    environment.systemPackages = with pkgs; [
      gnome.gnome-tweaks
      gnome.gnome-shell-extensions
      yaru-theme
    ];
  };
}
