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
            # showmode = false;
        };

        # ...mappings...
        maps = {
            normal = {
                "<C-s>" = ":w<CR>";
                #";" = ":<CR>";
                "<esc>" = { action = ":noh<CR>"; silent = true; };

                # Split window
                "<leader>s" = ":split<CR>";
                "<leader>v" = ":vsplit<CR>";

                # Quit current window
                "<leader>q" = ":q<CR>";

                # Save all files
                "<leader>w" = ":wa<CR>";

                # Format file
                #"<leader>i" = vim.lsp.buf.format;

                # Resize and move to the left
                "<C-h>" = "<C-w>h";
                "<M-h>" = ":vertical resize -10<CR>";

                # Resize and move to the right
                "<C-l>" = "<C-w>l";
                "<M-l>" = ":vertical resize +10<CR>";

                # Resize and move upwards
                "<C-k>" = "<C-w>k";
                "<M-k>" = ":resize -10<CR>";

                # Resize and move downwards
                "<C-j>" = "<C-w>j";
                "<M-j>" = ":resize +10<CR>";

                # Telescope
                "<leader>ff" = ":Telescope find_files<CR>";
                "<leader>fg" = ":Telescope live_grep<CR>";
                "<leader>fb" = ":Telescope buffers<CR>";
                "<leader>fh" = ":Telescope help_tags<CR>";
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

            lsp = {
                keymaps = {
                    silent = true;
                    diagnostic = {
                        "gd" = "goto_prev";
                        "gr" = "goto_next";
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
