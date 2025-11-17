{ config, pkgs, ... }:

{  

  home.packages = [
    pkgs.opencode
    pkgs.cherry-studio
    pkgs.lmstudio
  ];

}
