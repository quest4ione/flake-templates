{
  outputs = _: {
    templates.parts = {
      path = ./templates/parts;
      description = "An empty flake using flake-parts";
    };

    templates.zig = {
      path = ./templates/zig;
      description = "A flake for using the zig language";
    };
  };
}
