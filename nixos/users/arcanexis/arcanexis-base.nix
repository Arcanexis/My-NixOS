# 桌面环境配置
{ config, pkgs, ... }:

{
  # 桌面应用
  home.packages = with pkgs; [
    # 浏览器
    chromium
    google-chrome
 
    python3
    rustc
    cargo

  ];

    # 开发环境变量
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    GOPATH = "$HOME/go";
    NODE_ENV = "development";
  };

  # Git 配置
  programs.git = {
    enable = true;
    settings = {
      user.name = "arcanexis";
      user.email = "3526162625@qq.com";
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = false;
    };
  };

}
