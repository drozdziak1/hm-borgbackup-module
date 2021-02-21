{ config, pkgs, ... }:

{

  imports = [
    ./hm-borgbackup.nix
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.borgbackup.jobs."dora-home-drozdziak1" = {
    compression = "auto,lzma";
    paths = "/home/drozdziak1";
    exclude = [
      "/home/*/.cache"
      "/home/*/.ccache"
      "/home/*/.cargo/git/"
      "/home/*/.minikube/"
      "/**/target"
      "/home/*/go"
    ];
    extraCreateArgs = "--debug";
    encryption.mode = "none";
    repo = "/opt/backup/dora-home-drozdziak1";
    startAt = "00/2:00";
    prune.keep = {
      within = "1d";
      daily = 7;
      weekly = 4;
      monthly = -1;
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
