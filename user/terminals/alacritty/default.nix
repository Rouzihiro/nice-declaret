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
          y = 3;
        };
        opacity = 0.8;
      };

      scrolling = {
        history = 10000;
      };

      # font = {
      #   size = 9;
      # };

      mouse.bindings = [
        {
          mouse = "Middle";
          action = "PasteSelection";
        }
      ];

      # # Colors (Hyper)
      # colors = {
      #   # Default colors
      #   primary = {
      #     background = "#1c1c1c";
      #     foreground = "0xd5c4a1";
      #   };
      #   cursor = {
      #     text = "0xF81CE5";
      #     cursor = "0xffffff";
      #   };
      #
      #   # Normal colors
      #   normal = {
      #     black = "0x848484";
      #     red = "0xfb4934";
      #     green = "0xb8bb26";
      #     yellow = "0xfabd2f";
      #     blue = "0x83a598";
      #     magenta = "0xd3869b";
      #     cyan = "0x8ec07c";
      #     white = "0xd5c4a1";
      #   };
      #   # Bright colors
      #   bright = {
      #     black = "0x848484";
      #     red = "0xfb4934";
      #     green = "0xb8bb26";
      #     yellow = "0xfabd2f";
      #     blue = "0x83a598";
      #     magenta = "0xd3869b";
      #     cyan = "0x8ec07c";
      #     white = "0xd5c4a1";
      #   };
      # };
    };
  };
}
