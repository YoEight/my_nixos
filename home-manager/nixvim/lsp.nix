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

  plugins.nvim-cmp = {
    enable = true;
    snippet.expand = "luasnip";

    mapping = {
      "<C-d>" = "cmp.mapping.scroll_docs(-4)";
      "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<C-e>" = "cmp.mapping.close()";
      "<C-space>" = "cmp.mapping.complete()";
      "<CR>" = "cmp.mapping.confirm({ select = true })";
    };

    sources = [
      { name = "luasnip"; }
      { name = "nvim_lsp"; }
      { name = "cmdline"; }
      { name = "path"; }
      { name = "buffer"; }
    ];
  };

  plugins.cmp-buffer.enable = true;
  # plugins.nvim-lsp.enable = true;
  plugins.cmp-cmdline.enable = true;
  plugins.cmp-path.enable = true;
  plugins.luasnip.enable = true;
}
