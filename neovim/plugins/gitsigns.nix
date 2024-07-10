{...}: {
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
    };

    keymaps = [
    #  {
    #    mode = "n";
    #    key = "<leader>gs";
    #    action.__raw = ''require('gitsigns').stage_hunk()'';
    #    options = {desc = "Stage hunk";};
    #  }
    #  {
    #    mode = "v";
    #    key = "<leader>gs";
    #    action.__raw = ''require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' }'';
    #    options = {desc = "Stage hunk";};
    #  }
    #  {
    #    mode = "n";
    #    key = "<leader>gr";
    #    action.__raw = ''require('gitsigns').reset_hunk()'';
    #    options = {desc = "Reset hunk";};
    #  }
    #  {
    #    mode = "v";
    #    key = "<leader>gr";
    #    action.__raw = ''require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' }'';
    #    options = {desc = "Reset lines";};
    #  }
    ];
  };
}

