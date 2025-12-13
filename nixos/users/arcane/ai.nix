{ config, pkgs, ... }:

{  

  home.packages = with pkgs; [
    opencode
    cherry-studio
    kiro
    code-cursor
    vscode
    lmstudio
    ollama
    onnxruntime
  ];

}
