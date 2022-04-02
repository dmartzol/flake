{
    description = "NixOS systems and tools";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-21.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
        zig.url = "github:arqv/zig-overlay";
    };
    outputs = { self, nixpkgs, home-manager, ... }@inputs: let
    mkVM = import ./lib/mkvm.nix;
    overlays = [
        inputs.neovim-nightly-overlay.overlay
        (final: prev: {
            zig-master = inputs.zig.packages.${prev.system}.master.latest;
            kitty = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.kitty;
        })
    ];
    in {
        nixosConfigurations.utm-intel = mkVM "utm-intel" rec {
            inherit nixpkgs home-manager overlays;
            system = "x86_64-linux";
            user   = "dani";
        };
    };
}
