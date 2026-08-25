{ lib, ... }:
let
  templateSubmodule = {
    options = {
      description = lib.mkOption {
        type = lib.types.str;
        description = "A one-line description of the template, in CommonMark syntax.";
      };
      path = lib.mkOption {
        type = lib.types.path;
        description = "The path of the directory to be copied.";
      };
      welcomeText = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "A block of markdown text to display when a user initializes a new flake based on this template.";
      };
    };
  };

  templatesModule = {
    options = {
      flake.templates = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule templateSubmodule);
        default = {};
        description = "Templates for initializing a flake";

        apply = templates: (lib.mapAttrs (_: template:
          if template.welcomeText == null
          then lib.removeAttrs template [ "welcomeText"]
          else template
        ) templates);
      };
    };
  };
in
{
  imports = [ templatesModule ];
  flake.flakeModules.templates = templatesModule;
}
