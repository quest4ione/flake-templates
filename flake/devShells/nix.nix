{
  perSystem =
    { pkgs, ... }:
    {
      devShells.nix = pkgs.mkShell {
        packages = [
          pkgs.nixfmt
          pkgs.nil
        ];
      };
    };
}
