{ pkgs, nixvim, inputs,... }:
{
    programs.nixvim= {
        enable = true;
        #colorschemes.gruvbox.enable = true;


        # Configure neovim options...
        globals.mapleader = " ";
        options = {
            number = true;
            relativenumber = true;
            incsearch = true;
            tabstop = 4;
            softtabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            wrap = false;
            swapfile = false;
            backup = false;
            undofile = true;
            hlsearch = false;
            scrolloff = 8;
            signcolumn = "yes";
            termguicolors = true;
            updatetime = 50;
            #colorcolumn = "80";

            guicursor = [
                "n-v-c:block" # Normal, visual, command-line: block cursor
                "i-ci-ve:block" # Insert, command-line insert, visual-exclude: vertical bar cursor with block cursor, use "ver25" for 25% width
                "r-cr:hor20" # Replace, command-line replace: horizontal bar cursor with 20% height
                "o:hor50" # Operator-pending: horizontal bar cursor with 50% height
                "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" # All modes: blinking settings
                "sm:block-blinkwait175-blinkoff150-blinkon175" # Showmatch: block cursor with specific blinking settings
            ];

            cmdheight = 0;

            # Enable cursor line highlight
            cursorline = true; # Highlight the line where the cursor is located
            cursorcolumn = true;

            # Better splitting
            splitbelow = true;
            splitright = true;

            # Enable mouse mode
            mouse = "a"; # Mouse

            # Enable ignorecase + smartcase for better searching
            ignorecase = true;
            smartcase = true; # Don't ignore case with capitals
            grepprg = "rg --vimgrep";
            grepformat = "%f:%l:%c:%m";

            # We don't need to see things like INSERT anymore
            showmode = true;
        };

        # ...mappings...
        keymaps = [
            {
                key = ";";
                action = ":";
            }
            {
                mode = "n";
                key = "<C-s>";
                action = ":w<CR>";
            }
            {
                mode = "n";
                key = "<esc>";
                action = ":noh<CR>";
                options.silent = true;
            }


            # Split window
            {
                mode = "n";
                key = "<leader>s";
                action = ":split<CR>";
            }

            {
                mode = "n";
                key = "<leader>v";
                action = ":vsplit<CR>";
            }

            # Quit current window
            {
                mode = "n";
                key = "<leader>q";
                action = ":q<CR>";
            }

            # Save all files
            {
                mode = "n";
                key = "<leader>w";
                action = ":wa<CR>";
            }

            # Format file
            #"<leader>i" = vim.lsp.buf.format;

            # Resize and move to the left
            {
                mode = "n";
                key = "<C-h>";
                action = "<C-w>h";
            }

            {
                mode = "n";
                key = "<M-h>";
                action = ":vertical resize -10<CR>";
            }

            # Resize and move to the right
            {
                mode = "n";
                key = "<C-l>";
                action = "<C-w>l";
            }

            {
                mode = "n";
                key = "<M-l>";
                action = ":vertical resize +10<CR>";
            }

            # Resize and move upwards
            {
                mode = "n";
                key = "<C-k>";
                action = "<C-w>k";
            }

            {
                mode = "n";
                key = "<M-k>";
                action = ":resize -10<CR>";
            }

            # Resize and move downwards
            {
                mode = "n";
                key = "<C-j>";
                action = "<C-w>j";
            }

            {
                mode = "n";
                key = "<M-j>";
                action = ":resize +10<CR>";
            }

            # Telescope
            {
                mode = "n";
                key = "<leader>ff";
                action = ":Telescope find_files<CR>";
            }

            {
                mode = "n";
                key = "<leader>fg";
                action = ":Telescope live_grep<CR>";
            }

            {
                mode = "n";
                key = "<leader>fb";
                action = ":Telescope buffers<CR>";
            }

            {
                mode = "n";
                key = "<leader>fh";
                action = ":Telescope help_tags<CR>";
            }

            {
                mode = "v";
                key = ">";
                action = ">gv";
            }

            {
                mode = "v";
                key = "<";
                action = "<gv";
            }
        ];

       #extraPlugins = with pkgs.vimPlugins; [
       #    {
       #        plugin = comment-nvim;
       #        config = "lua require(\"Comment\").setup()";
       #    }
       #];

        # ...plugins...
        #plugins = {

           # telescope.enable = true;

           #conform-nvim = {
           #    enable = true;
           #    formatOnSave = {
           #        lspFallback = true;
           #        timeoutMs = 500;
           #    };
           #    notifyOnError = true;
           #    formattersByFt = {
           #        html = [ [ "prettierd" "prettier" ] ];
           #        css = [ [ "prettierd" "prettier" ] ];
           #        javascript = [ [ "prettierd" "prettier" ] ];
           #        javascriptreact = [ [ "prettierd" "prettier" ] ];
           #        typescript = [ [ "prettierd" "prettier" ] ];
           #        typescriptreact = [ [ "prettierd" "prettier" ] ];
           #        python = [ "black" ];
           #        lua = [ "stylua" ];
           #        nix = [ "nixpkgs_fmt" ];
           #        markdown = [ [ "prettierd" "prettier" ] ];
           #        yaml = [ "yamlfmt" ];
           #    };
           #};

           #lsp = {
           #    keymaps = {
           #        silent = true;
           #        diagnostic = {
           #            "gd" = "goto_prev";
           #            "gr" = "goto_next";
           #        };

           #        lspBuf = {
           #            gd = "definition";
           #            K = "hover";
           #        };
           #    };

           #    servers = {
           #        tsserver.enable = true;

           #        lua-ls = {
           #            enable = true;
           #            settings.telemetry.enable = false;
           #        };
           #        rust-analyzer = {
           #            enable = true;
           #            #installCargo = true;
           #        };
           #    };
           #};


        #};
    };

    }
