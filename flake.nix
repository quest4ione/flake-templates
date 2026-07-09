{
  outputs = _: {
    templates.parts = {
      path = ./templates/parts;
      description = "An empty flake using flake-parts";
    };
  };
}
