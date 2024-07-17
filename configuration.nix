{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb = {
	layout = "us";
    };
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
    LIBVA_DRIVER_NAME = "iHD";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.fish.enable = true;
  users.users.philip = {
    isNormalUser = true;
    description = "Philip Johansson";
    extraGroups = [ "wheel" "video" "networkmanager" ];
    shell = pkgs.fish;
    packages = with pkgs; [brightnessctl];
  };

  # Audio stuff
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.pipewire.wireplumber.extraConfig = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
    };
  };

  # Graphical
  environment.systemPackages = with pkgs; [
    sway
    wayland
    xdg-utils
    glib
    grim
    slurp
    waybar
    wl-clipboard
  ];

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Needed for home-manager to be able to handle privligies through sway
  security.polkit.enable = true;

  programs = {
    sway.enable = true;
    waybar.enable = true;
  };

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  services.openssh.enable = true;
  services.avahi.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            intel-media-driver # LIBVA_DRIVER_NAME=iHD
            intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
            libvdpau-va-gl
        ];
    };

  # don't touch
  system.stateVersion = "24.05"; # Did you read the comment?

}
