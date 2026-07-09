{ ... }: {
  perSystem = { pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      packages = [
        pkgs.zig # the zig cli
        pkgs.zls # the zig language server
      ];
    };
  };
}
