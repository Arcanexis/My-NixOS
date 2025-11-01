{ config, pkgs, ... }:

{  

  environment.systemPackages = [
    pkgs.opencode
    pkgs.cherry-studio
  ];

}
