{ pkgs, ... }:

{
  home.packages = with pkgs; [
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

  programs = {
    fish = {
      enable = true;

      shellAliases = {
        dy = "dig +noall +answer +additional $argv[1] @dns.toys";
      };

      shellAbbrs = {
        tailf = "tail -f";
        cat = "bat";
        findport = "sudo lsof -iTCP -sTCP:LISTEN -n -P | grep";
      };

      functions = {
        spot = "mdfind \"kMDItemDisplayName==\'\*\$argv\*\'cd\"";

        genpass = ''
        LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy
        '';

        proxy = ''
        switch $argv
        case "off"
          set -e http_proxy
          set -e https_proxy
          echo 'http[s]_proxy erased.'
        case "*"
          set -gx http_proxy "http://127.0.0.1:7890"
          set -gx https_proxy "http://127.0.0.1:7890"
          echo 'https[s]_proxy set.'
        end
        '';
      };
    };

    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
    };

    # skim provides a single executable: sk.
    # Basically anywhere you would want to use grep, try sk instead.
    skim = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
