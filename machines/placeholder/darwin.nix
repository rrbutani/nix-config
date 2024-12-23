# optionally, can ask for flake inputs.
inputs@{ home-manager, ... }:

{
  system = "aarch64-darwin";

  # Can reference modules, mixins here by relative path.
  modules = [
    # Add the home-manager module and make the flake inputs accessible to
    # home-manager modules:
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        extraSpecialArgs = inputs;
        useUserPackages = true;
        useGlobalPkgs = true;
        users.example = import ../../mixins/home-manager/placeholder.nix;
      };
    }

    ../../modules/darwin/placeholder.nix
    {
      users.users.example.home = "/home/example";
    }
  ];

  # Flake inputs are always going to be prepended onto this set anyways though:
  inputs = {};
}
