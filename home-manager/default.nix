{ config, pkgs, inputs, system, ... }:
let
  neovimConfig = import ./nixvim;
  nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
    inherit pkgs;
    module = neovimConfig;
  };
in {
  home.username = "yoeight";
  home.homeDirectory = "/home/yoeight";

  home.packages = with pkgs; [
    nvim
    nixfmt
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
      user.signingKey =
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGtMMOPUb/XZ2wD/49TnTqWxcISgQDwgE4MdtvaCFOYF";
      gpg."ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";
      commit.gpgsign = true;
    };
  };

  programs.ssh = {
    enable = true;
    forwardAgent = true;
    extraConfig =
      "IdentityAgent ${config.home.homeDirectory}/.1password/agent.sock";
  };

  programs.vscode = {
    enable = true;

    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      rust-lang.rust-analyzer
      bbenoist.nix
      ms-dotnettools.csharp
      github.vscode-pull-request-github
      haskell.haskell
      sumneko.lua
      brettm12345.nixfmt-vscode
    ];

    userSettings = {
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "editor.fontFamily" = "UbuntuSansMono Nerd Font";
      "editor.minimap.enabled" = false;
      "explorer.fileNesting.enabled" = true;
      "vim.useCrtlKeys" = true;
      "vim.useSystemClipboard" = true;
      "extensions.ignoreRecommendations" = true;
      "trailing-spaces.deleteModifiedLinesOnly" = true;
      "rust-analyzer.workspace.symbol.search.kind" = "all_symbols";
      "window.titleBarStyle" = "custom";
      "window.dialogStyle" = "custom";
    };
  };

  home.stateVersion = "23.11";
}
