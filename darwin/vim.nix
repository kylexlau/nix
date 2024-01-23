{ ... }:
{
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = false;
    plugins.lightline.enable = true;
  };
}

