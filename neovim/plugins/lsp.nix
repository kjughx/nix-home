{...}: {
  programs.nixvim = {
    plugins.fidget.enable = true;

    plugins.lsp = {
      enable = true;

      keymaps = {
        silent = true;

        diagnostic = {
          "<leader>ld" = "open_float";
          "[d" = "goto_next";
          "]d" = "goto_prev";
        };

        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gr" = "references";
          "K" = "hover";
          "<C-h>" = "signature_help";
          "<leader>lS" = "workspace_symbol";
          "<leader>ls" = "document_symbol";
          "<leader>la" = "code_action";
          "<leader>lf" = "format";
          "<leader>lr" = "rename";
        };
      };

      servers = {
        clangd.enable = true;
        nixd.enable = true;
        rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
        };
      };
    };

    plugins.cmp = {
      enable = true;

      settings = {
        sources = [
          {name = "path";}
          {name = "nvim_lsp";}
          {name = "nvim_lua";}
          {
            name = "luasnip";
            keyword_length = 2;
          }
          {
            name = "buffer";
            keyword_length = 3;
          }
        ];

        mapping = {
            __raw = ''
              cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = false },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                    end, { 'i', 's', }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                    end, { 'i', 's', }),
              })
            '';
        };
      };
    };
  };
}
