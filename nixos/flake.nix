{
  description = "Arcane's Modular NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };

    #noctalia-shell(niri)
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell"; 
    };
    
    # DankMaterialShell(niri)
    /*niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    }; */
    
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    }; 

  };

 
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware-configuration.nix
          ./base.nix
          ./share/users-base.nix
          ./share/niri.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              
              # Arcane 主用户（AI agent） —— 擅长AI智能体和工具的开发使用(coding)，成为AI超级个体
              users.arcane = {
                home.username = "arcane";
                home.homeDirectory = "/home/arcane";
                home.stateVersion = "25.05";
                programs.home-manager.enable = true;

                imports = [
                  ./users/arcane/arcane-base.nix
                  ./users/arcane/development.nix
                  #./share/noctalia.nix
                  ./share/DankMaterialShell.nix
                  ];
                };
              
              # Arcanexis 用户 —— AI研究员（算法和工程学习）
              users.arcanexis = {
                home.username = "arcanexis";
                home.homeDirectory = "/home/arcanexis";
                home.stateVersion = "25.05";
                programs.home-manager.enable = true;

                imports = [
                  ./users/arcanexis/arcanexis-base.nix
                  ./share/noctalia.nix 
                  ];
                };


              # Jerry  —— 量化金融与商业分析
              users.jerry = {
                home.username = "jerry";
                home.homeDirectory = "/home/jerry";
                home.stateVersion = "25.05"; 
                programs.home-manager.enable = true;

                imports = [
                  ./users/jerry/jerry-base.nix
                  ./share/noctalia.nix
                 ];
               };

              # learner 用户 —— 日常学习娱乐
              users.learner = {
                home.username = "learner";
                home.homeDirectory = "/home/learner";
                home.stateVersion = "25.05";
                programs.home-manager.enable = true;

                imports = [
                   ./users/learner/learner-base.nix
                   ./share/DankMaterialShell.nix
                  ];
                };

            };
          }
        ];
      };
    };
  };
} 
