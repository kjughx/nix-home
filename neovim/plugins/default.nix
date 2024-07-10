{pkgs, ...}: {
    imports = [
        ./treesitter.nix
        ./lsp.nix
        ./gitsigns.nix
    ];

    programs.nixvim = {
        extraPlugins = [pkgs.vimPlugins.gruvbox-material];
        colorscheme = "gruvbox-material";

        plugins.surround.enable = true;
        plugins.comment = {
            enable = true;
            settings = {
                toggler = {
                    line = "<leader>/";
                    block = "<leader>?";
                };
                opleader = {
                    line = "<leader>/";
                    block = "<leader>?";
                };
            };
        };
        plugins.which-key.enable = true;
        plugins.mini = {
            enable = true;
            modules = {
                statusline.enable = true;
            };
        };
    };
}
