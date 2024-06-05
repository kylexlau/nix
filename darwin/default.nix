{ pkgs, lib, ... }:

{

  imports = [
    ./sys.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    #git
    #vim
    #neofetch
  ];

  # Nix settings
  nix.settings.substituters = ["https://mirror.sjtu.edu.cn/nix-channels/store" "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Use this instead of services.nix-daemon.enable if you
  # don't wan't the daemon service to be managed for you.
  # nix.useDaemon = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";

  nix.package = pkgs.nix;
  programs.nix-index.enable = true;

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nix.settings = {
    auto-optimise-store = true;
  };
}
