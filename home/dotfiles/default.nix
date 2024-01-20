{ config, pkgs, lib, ... }:
{
    home.file = {
        hammerspoon = {
            source = ./hammerspoon;
            target = ".hammerspoon";
            recursive = true;
        };
    };
}
