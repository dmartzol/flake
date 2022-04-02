{ config, pkgs, ... }: {
imports = [ ./shared.nix ];
#virtualisation.vmware.guest.enable = true;
# Interface is this on Intel Fusion
#networking.interfaces.ens33.useDHCP = false;
}
