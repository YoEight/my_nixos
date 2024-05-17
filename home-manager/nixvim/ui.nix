{...}:
{ 
  plugins.neo-tree.enable = true;
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      no_italic = true;
      no_bold = true;
      integrations = {
        cmp = true;
        gitsigns = true;
        treesitter = true;
      };
    };
  };
}
