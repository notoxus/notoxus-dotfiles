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

  # Enter Niri automatically once when the VM boots. Logging out returns to
  # greetd instead of immediately starting another session.
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "juo";
      };
      default_session = {
        command = "${pkgs.greetd}/bin/agreety --cmd ${pkgs.niri}/bin/niri-session";
        user = "greeter";
      };
    };
  };

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
    neovim
    tree
    fastfetch
    firefox
    wl-clipboard
    ghostty
    starship
    tmux
    fzf
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
    yazi
    eza
    lazygit
    bat
    delta
    dust

    # Optional daily applications — uncomment only when you want them:
    # obs-studio
    # rnote
    # gaphor
    # libreoffice-fresh
    # zotero

    # BentoPDF is started on demand through the `bentopdf` Zsh alias.
    # https://github.com/alam00000/bentopdf
    # Vietnamese input is optional too; install and configure it manually:
    # https://github.com/LotusInputMethod/fcitx5-lotus
  ];

  environment.pathsToLink = [
    "/share/zsh-autosuggestions"
    "/share/zsh-syntax-highlighting"
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "26.05";
}
