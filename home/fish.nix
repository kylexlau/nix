{ ... }:
{
  programs.fish = {
    enable = true;

    # fix MacOS PATH
    loginShellInit = ''
      fish_add_path --prepend --global ~/.cargo/bin/ /etc/profiles/per-user/kyle/bin  /run/current-system/sw/bin
      fish_add_path --append --global ~/bin ~/go/bin ~/.juliaup/bin
    '';

    shellAliases = {
      dy = "dig +noall +answer +additional $argv[1] @dns.toys";
      #tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale";
    };

    shellAbbrs = {
      tailf = "tail -f";
      cat = "bat";
      findport = "sudo lsof -iTCP -sTCP:LISTEN -n -P | grep";
      vi = "nvim";
      vim = "nvim";
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
}
