{ pkgs, ... }:

let
  username = "kyle";
in
{
  # import sub modules
  imports = [
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
      fzf
      aria2
      socat
      nmap
    ];
  };

  programs = {
    home-manager.enable = true;
  
    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    eza = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
    };

    skim = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
