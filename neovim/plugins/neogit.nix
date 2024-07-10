{...}: {
  programs.nixvim = {
    plugins.plenary.enable = true;
    plugins.fzf-lua.enable = true;

    plugins.neogit = {
      enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action.__raw = ''vim.cmd.Git'';
        options = {desc = "Git Status";};
      }
    ];
  };
}

