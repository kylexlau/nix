{ ... }:
{
  programs.nixvim = {
    enable = true;
    colorschemes.kanagawa.enable = true;

    options = {
      expandtab = true;
      shiftwidth = 4;
      smartindent = true;
      tabstop = 4;
      completeopt = "menu,noinsert,preview";
      hidden = true;
      ignorecase = true;
      joinspaces = false;
      scrolloff = 4;
      shiftround = true;
      sidescrolloff = 8;
      smartcase = true;
      splitright = true;
      termguicolors = true;
      wildmode = "list:longest";
      list = true;
      number = true;
      relativenumber = true;
      wrap = false;
      undofile = true;
      clipboard = "unnamedplus";
      cursorcolumn = true;
      spell = true;
    };

    plugins = {
      coq-nvim = {
        enable = true;
        autoStart = "shut-up";
        installArtifacts = true;
      };
      treesitter = {
        enable = true;
      };
      trouble = {
        enable = true;
      };
      gitsigns = {
        enable = true;
      };
      crates-nvim = {
        enable = true;
      };
      comment-nvim = {
        enable = true;
      };
      lualine = {
        enable = true;
      };
      undotree = {
        enable = true;
      };
      neogit = {
        enable = true;
      };
      neorg = {
        enable = true;
      };
      nvim-lightbulb = {
        enable = true;
      };
      treesitter-context = {
        enable = true;
      };
      telescope = {
        enable = true;
      };
      rust-tools = {
        enable = true;
      };
      lsp-lines = {
        enable = true;
      };
      lspsaga = {
        enable = true;
      };
      neogen = {
        enable = true;
      };
      wilder = {
        enable = true;
        modes = [ ":" "/" "?" ];
      };
      diffview = {
        enable = true;
      };
      illuminate = {
        enable = true;
      };

      none-ls = {
        enable = true;
        sources = {
          diagnostics = {
            shellcheck.enable = true;
            # vale.enable = true;
            # alex.enable = true;
            gitlint.enable = true;
            # protolint.enable = true;
            # hadolint.enable = true;
            # luacheck.enable = true;
            # mypy.enable = true;
            # yamllint.enable = true;
            # eslint_d.enable = true;
            deadnix.enable = true;
            statix.enable = true;
          };
          formatting = {
            # isort.enable = true;
            # taplo.enable = true;
            # jq.enable = true;
            stylua.enable = true;
            # markdownlint.enable = true;
            prettier.enable = true;
            # rustfmt.enable = true;
            black.enable = true;
            # clang_format.enable = true;
            # sqlfluff.enable = true;
          };
        };
      };
    };
    extraConfigLua = ''
      vim.diagnostic.config({ virtual_lines = false })
    '';
  };
}
