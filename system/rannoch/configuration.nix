# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "rannoch"; # Define your hostname.

  boot.initrd.luks.devices."luks-d9050d09-9270-46eb-b719-b24f54dcfc7a".device = "/dev/disk/by-uuid/d9050d09-9270-46eb-b719-b24f54dcfc7a";
}
