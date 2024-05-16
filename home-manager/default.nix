{ config, pkgs, inputs, system, ... }:
let
  neovimConfig = import ./nixvim;
  nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
    inherit pkgs;
    module = neovimConfig;
  };
in
{
  home.username = "yoeight";
  home.homeDirectory = "/home/yoeight";

  home.packages = with pkgs; [
    nvim
    jetbrains-toolbox
    slack
    git
    _1password
    _1password-gui
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "yo.eight@gmail.com";
    userName = "YoEight";
    extraConfig = {
      gpg.format = "ssh";
      user.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGtMMOPUb/XZ2wD/49TnTqWxcISgQDwgE4MdtvaCFOYF";
      gpg."ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";
      commit.gpgsign = true;
    };
  };

  programs.ssh = {
    enable = true;
    forwardAgent = true;
    extraConfig = "IdentityAgent ${config.home.homeDirectory}/.1password/agent.sock";
  };

  home.stateVersion = "23.11";
}
