{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    extraPackages = with pkgs; [
      lazygit
      lua-language-server
      stylua
      ripgrep
      vimPlugins.LazyVim
    ];

    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      LazyVim
    ];
  };
}
