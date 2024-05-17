{...}:
{ 
  plugins.neo-tree.enable = true;
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      disableItalic = true;
      disableBold = true;
      integrations = {
        cmp = true;
        gitsigns = true;
        treesitter = true;
      };
    };
  };
}
