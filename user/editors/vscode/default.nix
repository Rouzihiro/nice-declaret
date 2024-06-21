{
  config,
  pkgs,
  mySettings,
  ...
}: let 

codeBgColor = "#" + config.lib.stylix.colors.base00;
termBgColor = "#" + config.lib.stylix.colors.base00;

# codeBgColor = "#1d2021";
# termBgColor = "#1c1c1c";

in {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      pkief.material-icon-theme
      vscodevim.vim
      esbenp.prettier-vscode
      usernamehw.errorlens
      alefragnani.project-manager
      svelte.svelte-vscode
      ritwickdey.liveserver
      bbenoist.nix
    ];

    userSettings = {
      "workbench.colorCustomizations" = {
        "editor.background" = "${codeBgColor}";
        "sideBar.background" = "${codeBgColor}";
        "profileBadge.background" = "${codeBgColor}";
        "activityBar.background" = "${codeBgColor}";
        "progressBar.background" = "${codeBgColor}";
        "badge.background" = "${codeBgColor}";
        "editorGroupHeader.tabsBackground" = "${codeBgColor}";
        "editorGroupHeader.noTabsBackground" = "${codeBgColor}";
        "editorGroup.dropBackground" = "${codeBgColor}";
        "tab.unfocusedActiveBackground" = "${codeBgColor}";
        "tab.inactiveBackground" = "${codeBgColor}";
        "tab.activeBackground" = "#2D2424";
        "panel.background" = "${termBgColor}";
        "panel.border" = "${termBgColor}";
        "statusBar.background" = "${codeBgColor}";
        "statusBarItem.remoteBackground" = "${codeBgColor}";
        "terminal.background" = "${termBgColor}";
        "terminal.dropBackground" = "${termBgColor}";
        "terminal.selectionBackground" = "${termBgColor}";
        "terminal.inactiveSelectionBackground" = "${termBgColor}";
        "terminal.findMatchHighlightBackground" = "${termBgColor}";
        "terminalCommandDecoration.defaultBackground" = "${termBgColor}";
        "terminalCommandDecoration.successBackground" = "${termBgColor}";
        "terminal.tab.activeBorder" = "#467f60";
      };
      "window.menuBarVisibility" = "toggle";
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[markdown]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[prisma]" = {
        "editor.defaultFormatter" = "Prisma.prisma";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "editor.codeActionsOnSave" = {
        "source.addMissingImports" = "explicit";
        "source.organizeImports" = "explicit";
      };
      "keyboard.dispatch" = "keyCode";
      "editor.mouseWheelZoom" = true;
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.cursorSurroundingLines" = 5;
      "editor.fontFamily" = "${mySettings.user.font}";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 16;
      "editor.fontWeight" = "500";
      "editor.formatOnSave" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.lineNumbers" = "relative";
      "editor.linkedEditing" = true;
      "editor.minimap.enabled" = false;
      "editor.smoothScrolling" = true;
      "editor.stickyScroll.enabled" = true;
      "editor.suggest.insertMode" = "replace";
      "editor.suggestFontSize" = 14;
      "editor.wordWrap" = "on";
      "errorLens.fontStyleItalic" = true;
      "everforest.italicKeywords" = true;
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "extensions.autoUpdate" = "onlyEnabledExtensions";
      "extensions.ignoreRecommendations" = false;
      "files.exclude" = {
        "**/node_modules" = true;
      };
      "prettier.semi" = false;
      "prettier.singleAttributePerLine" = true;
      "prettier.singleQuote" = true;
      "prettier.trailingComma" = "all";
      "projectManager.git.baseFolders" = ["$home/coding"];
      "projectManager.sortList" = "Recent";
      "sortJSON.orderOverride" = [
        "name"
        "version"
        "main"
        "module"
        "types"
        "typings"
        "files"
        "publishConfig"
        "repository"
        "scripts"
        "prefix"
        "description"
        "body"
      ];
      "sortJSON.orderUnderride" = [
        "resolutions"
        "dependencies"
        "devDependencies"
        "peerDependencies"
        "cSpell.userWords"
      ];
      "typescript.preferences.importModuleSpecifier" = "relative";
      "typescript.updateImportsOnFileMove.enabled" = "always";
      "update.showReleaseNotes" = false;
      "vim.foldfix" = true;
      "vim.highlightedyank.color" = "rgba(230, 97, 89, 0.7)";
      "vim.highlightedyank.enable" = true;
      "vim.highlightedyank.textColor" = "white";
      "vim.hlsearch" = true;
      "vim.leader" = "<space>";
      "vim.normalModeKeyBindingsNonRecursive" = [
        # // switch b/w buffers
        {
          "before" = ["<S-h>"];
          "commands" = [":bprevious"];
        }
        {
          "before" = ["<S-l>"];
          "commands" = [":bnext"];
        }
        # // splits
        {
          "before" = ["leader" "v"];
          "commands" = [":vsplit"];
        }
        {
          "before" = ["leader" "s"];
          "commands" = [":split"];
        }
        # // panes
        {
          "before" = ["C-h"];
          "commands" = ["workbench.action.focusLeftGroup"];
        }
        {
          "before" = ["C-j"];
          "commands" = ["workbench.action.focusBelowGroup"];
        }
        {
          "before" = ["C-k"];
          "commands" = ["workbench.action.focusAboveGroup"];
        }
        {
          "before" = ["C-l"];
          "commands" = ["workbench.action.focusRightGroup"];
        }
        # //----
        {
          "before" = ["leader" "r"];
          "commands" = ["editor.action.rename"];
        }
        # // NICE TO HAVE
        {
          "before" = ["leader" "w"];
          "commands" = [":w!"];
        }
        {
          "before" = ["leader" "q"];
          "commands" = [":q!"];
        }
        {
          "before" = ["leader" "x"];
          "commands" = [":x!"];
        }

        {
          "after" = ["g" "g" "V" "G"];
          "before" = ["<c-a>"];
        }
        {
          "before" = ["<leader>" "k"];
          "commands" = ["editor.action.showHover"];
        }
        {
          "before" = ["]" "d"];
          "commands" = ["editor.action.marker.next"];
        }
        {
          "before" = ["<leader>" "c" "a"];
          "commands" = ["editor.action.quickFix"];
        }
        {
          "after" = ["^"];
          "before" = ["H"];
        }
        {
          "after" = ["$"];
          "before" = ["L"];
        }
        {
          "before" = ["leader" "i"];
          "commands" = ["extension.toggleBool"];
        }
        {
          "before" = ["leader" "f"];
          "commands" = ["workbench.action.quickOpen"];
        }
        {
          "before" = ["leader" "p"];
          "commands" = ["editor.action.formatDocument"];
        }
        {
          "before" = ["g" "h"];
          "commands" = ["editor.action.showDefinitionPreviewHover"];
        }
      ];
      "vim.useSystemClipboard" = true;
      "workbench.settings.editor" = "json";
      "workbench.startupEditor" = "readme";
      "zenMode.hideLineNumbers" = false;
      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "workbench.iconTheme" = "material-icon-theme";
      "svelte.enable-ts-plugin" = true;
      "zenMode.fullScreen" = false;
      "editor.inlayHints.enabled" = "offUnlessPressed";
      "zenMode.centerLayout" = false;
      "[jsonc]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "zenMode.showTabs" = "none";
      "glassit.alpha" = 255;
      "terminal.integrated.fontSize" = 12;
      "prettier.tabWidth" = 4;
      "[css]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };

    keybindings = [
      {
        "command" = "projectManager.listGitProjects#sideBarGit";
        "key" = "ctrl+o";
      }
      {
        "command" = "expand_region";
        "key" = "ctrl+=";
        "when" = "editorTextFocus";
      }
      {
        "command" = "undo_expand_region";
        "key" = "ctrl+-";
        "when" = "editorTextFocus && editorHasSelection";
      }
      {
        "command" = "workbench.action.toggleSidebarVisibility";
        "key" = "ctrl+e";
      }
      {
        "command" = "workbench.files.action.focusFilesExplorer";
        "key" = "ctrl+e";
        "when" = "editorTextFocus";
      }
      {
        "command" = "explorer.newFile";
        "key" = "a";
        "when" = "filesExplorerFocus && !inputFocus";
      }
      {
        "command" = "renameFile";
        "key" = "r";
        "when" = "filesExplorerFocus && !inputFocus";
      }
      {
        "command" = "filesExplorer.copy";
        "key" = "c";
        "when" = "filesExplorerFocus && !inputFocus";
      }
      {
        "command" = "filesExplorer.paste";
        "key" = "p";
        "when" = "filesExplorerFocus && !inputFocus";
      }
      {
        "command" = "deleteFile";
        "key" = "d";
        "when" = "filesExplorerFocus && !inputFocus";
      }
      {
        "command" = "editor.action.addSelectionToNextFindMatch";
        "key" = "ctrl+n";
        "when" = "editorFocus";
      }
      {
        "command" = "editor.action.addSelectionToNextFindMatch";
        "key" = "ctrl+n";
        "when" = "editorFocus";
      }
      {
        "command" = "-workbench.action.files.save";
        "key" = "ctrl+s";
      }
      {
        "command" = "saveAll";
        "key" = "ctrl+s";
      }
      {
        "command" = "-editor.action.addSelectionToNextFindMatch";
        "key" = "ctrl+d";
        "when" = "editorFocus";
      }
      {
        "command" = "-extension.vim_ctrl+d";
        "key" = "ctrl+d";
        "when" = "editorTextFocus && vim.active && vim.use<D-d> && !inDebugRepl";
      }
      {
        "command" = "workbench.action.splitEditor";
        "key" = "ctrl+d";
      }
      {
        "command" = "-workbench.action.splitEditor";
        "key" = "ctrl+\\";
      }
      {
        "command" = "turboConsoleLog.displayLogMessage";
        "key" = "ctrl+i";
      }
      {
        "command" = "-turboConsoleLog.displayLogMessage";
        "key" = "ctrl+alt+l";
      }
      {
        "command" = "-undo";
        "key" = "ctrl+z";
      }
      {
        "command" = "-interactiveEditor.unstash";
        "key" = "ctrl+z";
        "when" = "interactiveEditorHasStashedSession && !editorReadonly";
      }
      {
        "command" = "workbench.action.toggleZenMode";
        "key" = "ctrl+z";
      }
      {
        "command" = "-workbench.action.toggleZenMode";
        "key" = "ctrl+k z";
      }
      {
        "command" = "-editor.action.selectAll";
        "key" = "ctrl+a";
      }
      {
        "command" = "editor.action.selectAll";
        "key" = "ctrl+a";
      }
      {
        "command" = "workbench.action.terminal.toggleTerminal";
        "key" = "ctrl+\\";
        "when" = "terminal.active";
      }
      {
        "command" = "-workbench.action.terminal.toggleTerminal";
        "key" = "ctrl+`";
        "when" = "terminal.active";
      }
    ];
  };
}
