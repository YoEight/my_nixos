{ pkgs, lib, ... }: {
  imports = [
    ./keymaps.nix
    ./ui.nix
    ./lsp.nix
    ./telescope.nix
    ./languages.nix
    ./utils.nix
  ];

  config = {
    globals = {
      mapleader = " ";
    };

    options = {
      number = true;
      wrap = false;
      cursorline = true;
      smartcase = true;
      splitbelow = true;
      splitright = true;
      termguicolors = true;
      showmode = false;
      wildmode = "list:longest";
      showmatch = true;
      signcolumn = "yes";
      clipboard = "unnamedplus";
    };
  };
}
