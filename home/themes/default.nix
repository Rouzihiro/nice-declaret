{ config, pkgs, ... }:

{
    gtk.enable = true;

    home.packages = with pkgs; [
	graphite-gtk-theme
    ];

    qt.enable = true;
    qt.platformTheme = "gtk";
    qt.style.package = pkgs.adwaita-qt;
    qt.style.name = "adwaite-dark";

    gtk.cursorTheme.package = pkgs.apple-cursor;
    gtk.cursorTheme.name = "macOS-BigSUr-White";
#gtk.cursorTheme.size = 16;

    gtk.theme.package = pkgs.gruvbox-dark-gtk;
    gtk.theme.name = "gruvbox-dark";

    gtk.iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    gtk.iconTheme.name = "oomox-gruvbox-dark";


    xdg.configFile."lf/icons".source = ./icons;
    programs.lf = {
	enable = true;
	commands = {
	    dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
	    editor-open = ''$$EDITOR $f'';
	    mkdir = ''
		''${{
		    printf "Directory Name: "
			read DIR
			mkdir $DIR
		}}
	    '';
	};

	keybindings = {

	    "\\\"" = "";
	    o = "";
	    c = "mkdir";
	    "." = "set hidden!";
	    "`" = "mark-load";
	    "\\'" = "mark-load";
	    "<enter>" = "open";

	    do = "dragon-out";

	    "g~" = "cd";
	    gh = "cd";
	    "g/" = "/";

	    ee = "editor-open";
	    V = ''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';

# ...
	};

	settings = {
	    preview = true;
	    hidden = true;
	    drawbox = true;
	    icons = true;
	    ignorecase = true;
	};

	extraConfig = 
	    let 
		previewer = "${pkgs.ctpv}/bin/ctpv";
		cleaner = "${pkgs.ctpv}/bin/ctpvclear";
	    in
	    ''
		set cleaner ${cleaner}/bin/clean.sh
		set previewer ${previewer}/bin/pv.sh
	    '';
	};
}
