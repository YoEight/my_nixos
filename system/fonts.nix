{ pkgs, ... }: {
  fonts.fontDir.enable = true;

  fonts.packages = with pkgs;
    [
      (nerdfonts.override {
        fonts = [ "UbuntuSans" "Ubuntu" "JetBrainsMono" ];
      })
    ];
}
