{ config, pkgs, inputs, system, ... }:
let
  neovimConfig = import ./nixvim;
  nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
    inherit pkgs;
    module = neovimConfig;
  };
  _1passwordPath = "~/.1password/agent.sock";
in
{
  home.username = "yoeight";
  home.homeDirectory = "/home/yoeight";

  home.packages = with pkgs; [
    nvim
    _1password
    _1password-gui
    jetbrains-toolbox
    slack
    git
  ];

  programs.git = {
    enable = true;
    # lfs.enable = true;
    userEmail = "yo.eight@gmail.com";
    userName = "YoEight";
    signing.key = ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGtMMOPUb/XZ2wD/49TnTqWxcISgQDwgE4MdtvaCFOYF'';
    # signing.signByDefault = true;
    signing.gpgPath = "${pkgs._1password-gui}/bin/op-ssh-sign";
    # extraConfig = {
    #   gpg.format = "ssh";
    # };
  };

  programs.ssh = {
    enable = true;
    forwardAgent = true;
    extraConfig = ''
      Host *
          IdentityAgent ${_1passwordPath}
    '';
  };

  home.stateVersion = "23.11";
}
