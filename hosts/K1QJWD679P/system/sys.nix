{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    _1password-cli
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
    prek
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

  users.users."lou.ferrand" = {
    name = "lou.ferrand";
    home = "/Users/lou.ferrand";
  };

  system.primaryUser = "lou.ferrand";
}
