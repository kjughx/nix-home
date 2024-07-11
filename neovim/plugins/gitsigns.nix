{...}: {
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      settings = {
          signs = {
            add = { text = "+" ;};
            change = { text = "~" ;};
            delete = { text = "_" ;};
            topdelete = { text = "‾" ;};
            changedelete = { text = "~" ;};
          };
          attach_to_untracked = true;
      };
    };

    keymaps = [
     {
       mode = "n";
       key = "<leader>gs";
       action.__raw = ''require('gitsigns').stage_hunk'';
       options = {desc = "Stage hunk";};
     }
     {
       mode = "v";
       key = "<leader>gs";
       action.__raw = ''function()require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' }end'';
       options = {desc = "Stage hunk";};
     }
     {
       mode = "n";
       key = "<leader>gr";
       action.__raw = ''require('gitsigns').reset_hunk'';
       options = {desc = "Reset hunk";};
     }
     {
       mode = "v";
       key = "<leader>gr";
       action.__raw = ''function()require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' }end'';
       options = {desc = "Reset lines";};
     }
    ];
  };
}

