{ config, pkgs, inputs, lib, ... }

{
  home.username = "reisa";
  home.homeDirectory = "/home/reisa";
  home.stateVersion = "24.05";
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePreadicate = (_: true);
    };
  };
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    bat
    fzf
    ripgrep
    jq
    tree
    exa
  ];
  programs.neovim {
    enable = true;
    viAlias = true;
    vimAlias = true;

    home.sessionVariables = {
      EDITOR="nvim";
    };
    home.shellAliases = {
      l = "exa"; 
      ls = "exa"; 
      cat = "bat"; 
    };
    programs.zsh = {
      enable = true;
    };
    programs.zsh.oh-my-zsh= {
      enable = true;
      plugins = ["git" "python" "docker" "fzf"];
      theme = "fino-time"
    };
  }
}
