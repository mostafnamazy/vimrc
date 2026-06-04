-- ~/.config/nvim/lua/plugins/laravel.lua
return {
  -- Laravel-specific commands (artisan, routes, views, ...)
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
    },
    ft = { "php", "blade" },
    event = { "BufEnter composer.json" },
    keys = {
      {
        "<leader>ll",
        function()
          Laravel.pickers.laravel()
        end,
        desc = "Laravel Picker",
      },
      {
        "<leader>la",
        function()
          Laravel.pickers.artisan()
        end,
        desc = "Artisan",
      },
      {
        "<leader>lr",
        function()
          Laravel.pickers.routes()
        end,
        desc = "Routes",
      },
      {
        "<leader>lm",
        function()
          Laravel.pickers.make()
        end,
        desc = "Make",
      },
    },
    opts = {},
  },

  -- navigation
  {
    "RicardoRamirezR/blade-nav.nvim",
    ft = { "blade", "php" },
    opts = {},
  },

  -- LSP
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "intelephense" },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            phpactor = { enabled = false },
            intelephense = {
              stubs = {
                "Core",
                "standard",
                "laravel",
                "blade",
                "eloquent",
                "carbon",
                "pcre",
                "psr-7",
              },
            },
          },
        },
      },
    },
  },

  -- PHP formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint" },
        blade = { "blade-formatter" },
      },
    },
  },
}
