{...}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<CR>";
        options = {desc = "Save buffer";};
      }
      {
        mode = "n";
        key = "<leader>q";
        action = "<cmd>q<CR>";
        options = {desc = "Close tab";};
      }
      {
        mode = "n";
        key = "<C-j>";
        action = ":m +1<CR>==";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = ":m -2<CR>==";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Lexplore<CR>";
        options = {desc = "Open file explorer";};
      }
      {
        mode = "n";
        key = "<leader>h";
        action = "<cmd>nohlsearch<CR>";
        options = {desc = "Clear highlighting";};
      }
      {
        mode = "n";
        key = "]b";
        action = "<cmd>bnext<CR>";
        options = {desc = "Next buffer";};
      }
      {
        mode = "n";
        key = "[b";
        action = "<cmd>bprevious<CR>";
        options = {desc = "Previous buffer";};
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>buffers<CR>";
        options = {desc = "List open buffers";};
      }
      {
        mode = "n";
        key = "<leader>bc";
        action = "<cmd>bdelete<CR>";
        options = {desc = "Close open buffer";};
      }
# Visual mode
      {
        mode = "v";
        key = "<C-j>";
        action = ":m '>+1<CR>gv==gv";
      }
      {
        mode = "v";
        key = "<C-k>";
        action = ":m '>-2<CR>gv==gv";
      }
      {
        mode = "v";
        key = "<";
        action = "<gv";
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
      }
      # -- greatest remap ever
      {
        mode = "x";
        key = "<leader>p";
        action = "\"_dP";
        options = {desc = "Paste over";};
      }
      # -- next greatest remap ever : asbjornHaland
      {
        mode = ["n" "v"];
        key = "<leader>y";
        action = "\"+y";
        options = {desc = "Copy to clipboard";};
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = "\"+Y";
        options = {desc = "Copy line to clipboard";};
      }
      # -- never press Q
      {
        mode = "n";
        key = "Q";
        action = "<nop>";
      }
      # -- for fast replace
      # {
      #   mode = "n";
      #   key = "<leader>s";
      #   action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gIc<Left><Left><Left>";
      #   options = {desc = "Replace word under cursor";};
      # }
      # -- don't be a pussy, just use hjkl
      {
        mode = "i";
        key = "<Up>";
        action = "<C-o>:echom \"--> k <-- \"<CR>";
      }
      {
        mode = "i";
        key = "<Down>";
        action = "<C-o>:echom \"--> j <-- \"<CR>";
      }
      {
        mode = "i";
        key = "<Right>";
        action = "<C-o>:echom \"--> k <-- \"<CR>";
      }
      {
        mode = "i";
        key = "<Left>";
        action = "<C-o>:echom \"--> h <-- \"<CR>";
      }
      {
        mode = "n";
        key = "<Up>";
        action = ":echom \"--> k <-- \"<CR>";
      }
      {
        mode = "n";
        key = "<Down>";
        action = ":echom \"--> j <-- \"<CR>";
      }
      {
        mode = "n";
        key = "<Right>";
        action = ":echom \"--> k <-- \"<CR>";
      }
      {
        mode = "n";
        key = "<Left>";
        action = ":echom \"--> h <-- \"<CR>";
      }
    ];
  };
}
