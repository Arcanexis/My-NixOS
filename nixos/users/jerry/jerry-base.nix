# Jerry桌面环境配置
{ config, pkgs, ... }:

{
  # 桌面应用
  home.packages = with pkgs; [
    # 浏览器
    chromium

    python3
    ghc
    ghcid
  ];

}
