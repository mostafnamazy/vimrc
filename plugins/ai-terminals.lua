-- lua/plugins/ai-terminals.lua
if true then
  return {}
end
return {
  "aweis89/ai-terminals.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminals = {
      aider = {
        cmd = function()
          return "aider --watch-files"
        end,
        path_header_template = "`%s`",
      },
    },
    auto_terminal_keymaps = {
      prefix = "<leader>a",
      terminals = {
        { name = "aider", key = "a" },
        { name = "claude", key = "c", enabled = false },
      },
    },
    watch_cwd = {
      gitignore = true,
    },
  },
  config = function(_, opts)
    require("ai-terminals").setup(opts)
    local sa = require("ai-terminals.snacks_actions")
    sa.apply(require("snacks").config)
  end,
}
