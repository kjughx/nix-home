{pkgs, ...} :
{

  home.packages = with pkgs; [
    fzf
    python3
    tmux
    ripgrep
    sshfs
    zed-editor
# This can come in shell.nix but zed doesn't know the path
    gcc
    rustup
    nodejs
  ];


  programs = {
    foot = {
      enable = true;
      settings = {
        main = {
          font = "FiraCode Nerd Font:size=13";
          font-bold = "FiraCode Nerd Font:style=Bold:size=13";
          font-italic = "FiraCode Nerd Font:style=Italic:size=13";
          font-bold-italic = "FiraCode Nerd Font:style=BoldItalic:size=13";
        };
      };
    };
    git = {
      enable = true;
      userName = "Philip Johansson";
      userEmail = "kjughx@gmail.com";
      extraConfig = {
        pull.rebase = true;
      };
    };
    fish = {
      enable = true;
      shellAliases = {
        vi = "nvim";
        vim = "nvim";
        gg = "vim -c 'Neogit'";
      };
      plugins = [
        { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
      ];
    };
  };
}
