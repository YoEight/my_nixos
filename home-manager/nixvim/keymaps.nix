{ ... }: {
  plugins.which-key = {
    enable = true;

    registrations = {
      "g" = "+go";
      "<leader>w" = "+windows";
      "<leader>f" = "+file";
      "<leader>c" = "+code";
      "<leader>fc" = "+config";
      "<leader>cl" = "+list";
    };
  };

  keymaps = [
    ###### Visual
    {
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<cr>";
      options = { desc = "Show type information"; };
    }

    {
      key = "<C-k>";
      action = "<cmd>lua vim.lsp.buf.signature_help()<cr>";
      options = { desc = "Show signature help"; };
    }
    ###### Root
    {
      key = "<leader>a";
      action = ":lua vim.lsp.buf.add_workspace_folder()<cr>";
      options = { desc = "Add workspace folder"; };
    }

    {
      key = "<leader>b";
      action = "<cmd>Telescope builtin<cr>";
      options = { desc = "List built-in pickers and run them on"; };
    }
    ###### Windows
    {
      key = "<leader>ww";
      action = ":wincmd w<cr>";
      options = { desc = "Focus to previous window"; };
    }

    {
      key = "<leader>wj";
      action = ":wincmd j<cr>";
      options = { desc = "Focus to window from below"; };
    }

    {
      key = "<leader>wh";
      action = ":wincmd h<cr>";
      options = { desc = "Focus to window from the left"; };
    }

    {
      key = "<leader>wk";
      action = ":wincmd k<cr>";
      options = { desc = "Focus to window from the top"; };
    }

    {
      key = "<leader>wl";
      action = ":wincmd l<cr>";
      options = { desc = "Focus to window from the right"; };
    }

    {
      key = "<leader>wc";
      action = ":wincmd c<cr>";
      options = { desc = "Close current window"; };
    }

    {
      key = "<leader>wv";
      action = ":vsplit<cr>";
      options = { desc = "Split current window vertivally"; };
    }

    {
      key = "<leader>ws";
      action = ":split<cr>";
      options = { desc = "Split current window horizontally"; };
    }

    {
      key = "<leader>w<";
      action = ":vert -10<cr>";
      options = { desc = "Decrease focused split columns by 10"; };
    }

    {
      key = "<leader>w>";
      action = ":vert +10<cr>";
      options = { desc = "Increase focused split columns by 10"; };
    }

    {
      key = "<leader>w-";
      action = ":res -10<cr>";
      options = { desc = "Decrease focused split row by 10"; };
    }

    {
      key = "<leader>w+";
      action = ":res +10<cr>";
      options = { desc = "Increase focused split row by 10"; };
    }
    ###### File
    {
      key = "<leader>ft";
      action = "<cmd>Neotree toggle reveal<cr>";
      options = { desc = "Toggle NeoTree"; };
    }

    {
      key = "<leader>fn";
      action = "<cmd>enew<cr>";
      options = { desc = "New file"; };
    }

    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options = { desc = "Find files"; };
    }

    {
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options = { desc = "Find buffers"; };
    }

    {
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
      options = { desc = "Search for a string in current working directory"; };
    }

    {
      key = "<leader>fo";
      action = "<cmd>Telescope oldfiles<cr>";
      options = { desc = "List previously open files"; };
    }

    {
      key = "<leader>fm";
      action = "<cmd>Telescope man_pages<cr>";
      options = { desc = "List manpage entries"; };
    }
    ###### Code
    {
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
      options = { desc = "Code action"; };
    }

    {
      key = "<leader>cd";
      action = "<cmd>Telescope diagnostics<cr>";
      options = { desc = "List diagnostics for all open buffers"; };
    }

    {
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format({ async = true })<cr>";
      options = { desc = "Format current buffer"; };
    }

    {
      key = "<leader>cld";
      action = "<cmd>Telescope lsp_document_symbols<cr>";
      options = { desc = "List document symbols"; };
    }

    {
      key = "<leader>clw";
      action = "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>";
      options = { desc = "List workspace symbols"; };
    }

    {
      key = "<leader>cr";
      action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      options = { desc = "Rename symbol"; };
    }
    ###### Go
    {
      key = "gD";
      action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
      options = { desc = "Go to declaration"; };
    }

    {
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<cr>";
      options = { desc = "Go to definition"; };
    }

    {
      key = "gr";
      action = "<cmd>lua vim.lsp.buf.references()<cr>";
      options = { desc = "Go to references"; };
    }
    ######
  ];
}
