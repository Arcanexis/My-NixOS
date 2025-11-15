# 桌面环境配置
{ config, pkgs, ... }:

{
  # 桌面应用
  home.packages = with pkgs; [
    # 浏览器
    chromium
    google-chrome
    
    # 通讯
     wechat
    
    # 办公
    onlyoffice-desktopeditors 
    feishu 
    obsidian
  ];

}
