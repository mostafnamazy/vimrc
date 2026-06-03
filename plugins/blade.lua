-- ~/.config/nvim/lua/plugins/blade.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
        "html",
        "css",
        "javascript",
      })
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },
}
