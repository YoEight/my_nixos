{...}:
{
  plugins.lsp-lines.enable = true;

  plugins.lsp = {
    enable = true;

    servers = {
      nixd.enable = true;
      lua-ls.enable = true;
    };
  };
}
