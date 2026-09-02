{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.noctalia.nixosModules.default
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  swapDevices = [
    {
      device = "/swapfile";
      size = 4096;    
    }
  ];
  programs.zsh.enable = true;
  programs.niri.enable = true;
  programs.noctalia.enable = true;
  # programs.noctalia.recommendedServices.enable = true;
  services.openssh.enable = true;

  users.users.juo = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" 
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    tree
    wl-clipboard
    ghostty
    starship
    tmux
    fzf
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "26.05";
}
