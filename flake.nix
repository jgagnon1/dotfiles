{
  description = "jgagnon nix-darwin + home-manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents = {
      url = "github:numtide/llm-agents.nix";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      ./darwin
    ];

    systems = [ "aarch64-darwin" "x86_64-darwin" ];

    # `nix develop` drops into a shell with darwin-rebuild available
    perSystem = { pkgs, system, ... }: {
      devShells.default = pkgs.mkShell {
        packages = [ inputs.darwin.packages.${system}.darwin-rebuild ];
      };
    };
  };
}
