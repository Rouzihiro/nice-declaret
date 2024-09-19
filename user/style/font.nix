{
	pkgs,
	...
}:
{
  home.packages = with pkgs; [
    # Fonts
	  texlivePackages.fontawesome
  ];

  fonts.fontconfig.enable = true;
}
