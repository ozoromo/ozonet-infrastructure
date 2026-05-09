{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";

    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    git-hooks,
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = f:
      nixpkgs.lib.genAttrs systems (system:
        f {
          inherit system;
          pkgs = nixpkgs.legacyPackages.${system};
        });

    mkPreCommit = system: pkgs:
      git-hooks.lib.${system}.run {
        src = ./.;
        hooks.tofu-fmt = {
          enable = true;
          name = "tofu fmt";
          entry = "${pkgs.opentofu}/bin/tofu fmt";
          files = "\\.tf$";
          language = "system";
        };
      };
  in {
    checks = forAllSystems ({
      system,
      pkgs,
    }: {
      pre-commit = mkPreCommit system pkgs;
    });

    devShells = forAllSystems ({
      system,
      pkgs,
    }: {
      default = pkgs.mkShell {
        inherit (mkPreCommit system pkgs) shellHook;
        packages = [pkgs.opentofu];
      };
    });

    formatter = forAllSystems ({pkgs, ...}: pkgs.alejandra);
  };
}
