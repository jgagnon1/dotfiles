{ inputs, ... }:

let
  mkDarwin = { system, hostModule, homeModule }: inputs.darwin.lib.darwinSystem {
    inherit system;
    modules = [
      hostModule
      inputs.home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "bak";
        home-manager.users.jgagnon = import homeModule;
        home-manager.extraSpecialArgs = {
          llm-agents-pkgs = inputs.llm-agents.packages.${system};
        };
      }
    ];
  };
in
{
  flake.darwinConfigurations = {
    "jgagnon-wsmb" = mkDarwin {
      system = "aarch64-darwin";
      hostModule = ./hosts/jgagnon-wsmb.nix;
      homeModule = ../home-manager/hosts/jgagnon-wsmb.nix;
    };
  };
}
