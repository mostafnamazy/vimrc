-- since this is just an example spec, don't actually load anything here and return an empty spec
if true then
	return {}
end
return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			interactions = {
				chat = {
					adapter = "anthropic",
					model = "claude-haiku-4-5",
				},
			},
			opts = {
				log_level = "DEBUG",
			},
		},
		config = function()
			require("codecompanion").setup({
				adapters = {
					http = {
						anthropic = function()
							return require("codecompanion.adapters").extend("anthropic", {
								url = "",
								env = {
									api_key = "",
								},
							})
						end,
					},
				},
			})
		end,
	},
}
