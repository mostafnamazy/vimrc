if true then
	return {}
end
return {
	{
		"milanglacier/minuet-ai.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"Saghen/blink.cmp",
		},
		config = function()
			require("minuet").setup({
				-- Your configuration options here
				lsp = {
					enabled_ft = { "toml", "lua", "cpp", "go" },
					completion = {
						-- Enables automatic completion triggering using `vim.lsp.completion.enable`
						enabled_auto_trigger_ft = { "cpp", "lua", "go" },
					},
				},
				duet = {
					provider = "claude",
					provider_options = {
						claude = {
							end_point = "",
							api_key = "",
						},
					},
				},
			})
		end,
	},
}
