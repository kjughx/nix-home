{pkgs, ...}: {
    options.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
        name = "neogit";
        src = pkgs.fetchFromGitHub {
          owner = "NeogitOrg";
          repo = "https://github.com/NeogitOrg/neogit";
          rev = "a20031f";
          hash = "";
        };
    })];
}
