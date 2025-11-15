{ config, pkgs, ... }:

{
   home.packages = with pkgs; [
    wechat
    qq 
    chromium
    google-chrome
    bilibili
    steam
    qqmusic
    feishu
    obsidian 
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
