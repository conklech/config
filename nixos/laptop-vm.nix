# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.binaryCaches = [ 
"https://ryantrinkle.com:5443" "https://cache.nixos.org" 
"https://hydra.nixos.org" ];
  nix.extraOptions = "auto-optimise-store = true";
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  fileSystems."/mnt/projects" = {
    fsType = "vboxsf";
    device = "Projects";
    options = "rw";
  };

  # networking.hostName = "nixos"; # Define your hostname.
  networking.hostId = "da2d2430";
  # networking.wireless.enable = true;  # Enables wireless.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "lat9w-16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable X11 forwarding. This requires a client setting?
  services.openssh.forwardX11 = true;
  programs.ssh.setXAuthLocation = true;

  users.mutableUsers = false;  
  users.extraUsers.christian = {
    isNormalUser = true;
    home = "/home/christian";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfatVATIzkiA//8vov/CJ/LKS3d4phs/A4qUIR2QKmTwqXmkfek7b7wv7ajfjwTxUwfL+ebgJP2jRbGfGrsiXRz3sBmtUALZQRlzuBn8Q6qHsebCsv2yUcuyxEz2W/wtNaQp/uzAfEZc9X4MG6rUPvlDBpVfFcxwuB7Hj58FLP9Gle3rNY0S+UmRjQfa1DPeUQ0Hj/TX/4u13CkquNE9AkxAwnhwxh4sgU9JS0vXA7TTZnTYTulqy6zAG5YoUXvRQ8RwzPT1WeW3eBp9AG8zkMMukpOJ4DqORmDNdZplYuN0EZK1/IKb6FsLAPDxsbfR0VrvImxYdYD5yukL4E6L7b Christian@LappyTab"
      ];
    uid = 1000;
  };
  users.extraUsers.test = {
    isNormalUser = true;
    home = "/home/test";
  };

  security.sudo.wheelNeedsPassword = false;

}
