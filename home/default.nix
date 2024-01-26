{ pkgs, ... }:

let
  username = "kyle";
in
{
  # import sub modules
  imports = [
    ./dotfiles
    ./git.nix
    ./fish.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "23.05";

    packages = with pkgs; [
      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      ripgrep
      jq
      yq-go
      aria2
      socat
      nmap

      nginx

      # fish
      fish
      oh-my-fish
      fishPlugins.done
      fishPlugins.fzf-fish
      fishPlugins.forgit
      fishPlugins.hydro
      fzf
      fishPlugins.grc
      grc
      skim
    ];
  };

  programs = {
    home-manager.enable = true;

    eza = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
    };
  };
}
