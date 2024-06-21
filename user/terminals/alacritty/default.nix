{
  config,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "none";
        dynamic_padding = true;
        padding = {
          x = 3;
          y = 4;
        };
        opacity = 1;
      };

      scrolling = {
        history = 10000;
      };

      mouse.bindings = [
        {
          mouse = "Middle";
          action = "PasteSelection";
        }
      ];
    };
  };
}
