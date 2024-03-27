{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    profiles.default = {
    };
  };
}
