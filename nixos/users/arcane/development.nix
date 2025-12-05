#  Arcane 开发环境配置
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # 版本控制
    git
    
    # 编辑器 & IDE
    zed-editor #rust写的下一代代码编辑器
    antigravity #谷歌反重力编辑器

    #容器支持
    distrobox #arch ubuntu (不影响nixos系统环境）   
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

 # 启用 direnv 和 nix-direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  # 关键：即使系统安装了 zsh，这里也必须启用
  # 这样 Home Manager 才有权限去管理 ~/.zshrc 并写入 direnv 的 hook
  programs.zsh = {
    enable = true;
    # 你可以在这里继续添加用户级的 zsh 配置，比如 alias, plugins 等
    # shellAliases = {
    #   ll = "ls -l";
    # };
  };

}
