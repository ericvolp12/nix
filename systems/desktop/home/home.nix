{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "user";
  home.homeDirectory = "/home/user";

  # Set some Environment Variables
  home.sessionVariables = {
    "GTK_THEME" = "Adwaita:dark";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # GTK Dark
  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };

  home.packages = [
    pkgs.nixpkgs-fmt
    pkgs.ferdium
    pkgs.git
    pkgs.btop
    pkgs.nvtop
    pkgs.notion-app-enhanced
    pkgs.fzf
    pkgs.python3
    pkgs.go
    pkgs.slack
    pkgs.screen
    pkgs.gcc
    pkgs.gnumake
    pkgs.fd
    pkgs.vscode
    pkgs.discord
    pkgs.glowing-bear
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one
    ];
  };

  programs.git =
    {
      enable = true;
      userName = "Eric Volpert";
      userEmail = "ericvolp12@gmail.com";
      aliases = {
        st = "status";
      };
    };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" ];
      theme = "ericvolp12";
    };
  };
}
