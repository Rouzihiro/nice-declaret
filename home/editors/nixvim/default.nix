{ pkgs, nixvim, inputs,... }:
{
    programs.nixvim= {
	enable = true;
	colorschemes.gruvbox.enable = true;


	# Configure neovim options...
	globals.mapleader = " ";
	options = {
	    number = true;
	    relativenumber = true;
	    incsearch = true;
	    shiftwidth = 4;
	};

	# ...mappings...
	maps = {
	    normal = {
		"<C-s>" = ":w<CR>";
		"<esc>" = { action = ":noh<CR>"; silent = true; };
	    };
	    visual = {
		">" = ">gv";
		"<" = "<gv";
	    };
	};

	extraPlugins = with pkgs.vimPlugins; [
	{
	    plugin = comment-nvim;
	    config = "lua require(\"Comment\").setup()";
	}
	];

	# ...plugins...
	plugins = {

	    telescope.enable = true;

	    lsp = {
		keymaps = {
		    silent = true;
		    diagnostic = {
			"<leader>k" = "goto_prev";
			"<leader>j" = "goto_next";
		    };

		    lspBuf = {
			gd = "definition";
			K = "hover";
		    };
		};

		servers = {
		    tsserver.enable = true;

		    lua-ls = {
			enable = true;
			settings.telemetry.enable = false;
		    };
		    rust-analyzer = {
			enable = true;
			#installCargo = true;
		    };
		};
	    };
	};


    };
}
