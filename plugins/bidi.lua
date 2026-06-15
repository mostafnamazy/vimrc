return {
  {
    "mcookly/bidi.nvim",
    opts = {
      create_user_commands = true, -- Generate user commands to enable and disable bidi-mode
      default_base_direction = "LR", -- Options: 'LR' and 'RL'
      intuitive_delete = true, -- Swap <DEL> and <BS> when using a keymap contra base direction
    },
  },
}
