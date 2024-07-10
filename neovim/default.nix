{nixvim, ...}: {
  imports = [
    nixvim.homeManagerModules.nixvim
    ./remap.nix
    ./opts.nix
    ./autocmd.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;

    viAlias = true;
    vimAlias = true;
  };
}
