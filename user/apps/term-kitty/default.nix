{lib, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = lib.mkForce "0.6";
      enable_audio_bell = "no";
      window_padding_width = 10;
    };
  };
}
