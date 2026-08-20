{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop
    curlie
    delta
    devenv
    difftastic
    direnv
    eza
    fd
    fish
    fzf
    ghq
    git
    helix
    jujutsu
    jjui
    lazygit
    neovim
    nil
    nixd
    nixfmt
    nixpkgs-fmt
    qmk
    rebar3
    riffdiff
    ripgrep
    rustup
    sd
    viddy
    vivid
    xh
    xz
    yazi
  ];

  users.users.lou = {
    name = "lou";
    home = "/Users/lou";
  };

  system.primaryUser = "lou";
}
