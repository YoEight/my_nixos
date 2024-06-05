# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "haestrom"; # Define your hostname.

  boot.initrd.luks.devices."luks-43d2eb5d-2dd3-4137-a17f-4cf1c2201653".device =
    "/dev/disk/by-uuid/43d2eb5d-2dd3-4137-a17f-4cf1c2201653";
}
