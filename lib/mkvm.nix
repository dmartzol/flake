# This function creates a NixOS system based on our VM setup for a
# particular architecture.
name: { nixpkgs, home-manager, system, user, overlays }:
nixpkgs.lib.nixosSystem rec {
    inherit system;
    modules = [
        { nixpkgs.overlays = overlays; }
        ../hardware/${name}.nix
        ../machines/${name}.nix
        ../users/${user}/nixos.nix
        home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import ../users/${user}/home.nix;
        }
    ];
    extraArgs = {
        currentSystem = system;
    };
}
