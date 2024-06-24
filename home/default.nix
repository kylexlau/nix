{pkgs, ...}: let
  username = "kyle";
in {
  # import sub modules
  imports = [
    ./dotfiles
    ./git.nix
    ./fish.nix
    ./neovim.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";

    packages = with pkgs; [
      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      jq
      yq-go
      aria2
      socat
      nmap
      neofetch

      nginx
      just

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

      # editor
      helix

      delta
    ];
  };

  programs = {
    home-manager.enable = true;

    eza = {
      enable = true;
      git = true;
      icons = true;
    };
  };
}
