return {
	{
		"robitx/gp.nvim",
		config = function()
			require("gp").setup({
				providers = {
					openai = {
						disable = true,
					},
					anthropic = {
						disable = false,
						endpoint = "https://yyyy/v1/messages",
						secret = "sk-C5",
					},
				},
				agents = {
					{
						name = "ChatClaude-3-7-Sonnet",
						disable = true,
					},
					{
						name = "ChatClaude-3-5-Haiku",
						disable = true,
					},
					{
						name = "CodeClaude-3-7-Sonnet",
						disable = true,
					},
					{
						name = "CodeClaude-3-5-Haiku",
						disable = true,
					},
					{
						provider = "anthropic",
						name = "ChatClaude-4-5-Haiku",
						chat = true,
						command = false,
						-- string with model name or table with model name and parameters
						model = { model = "claude-haiku-4-5", thinking_budget = 1024 },
						-- system prompt (use this to specify the persona/role of the AI)
						system_prompt = require("gp.defaults").chat_system_prompt,
					},
					{
						provider = "anthropic",
						name = "CodeClaude-4-5-Haiku",
						chat = false,
						command = true,
						-- string with model name or table with model name and parameters
						model = { model = "claude-4-5-haiku", temperature = 0.8, top_p = 1 },
						system_prompt = require("gp.defaults").code_system_prompt,
					},
				},
				hooks = {
					-- example of adding command which writes unit tests for the selected code
					UnitTests = function(gp, params)
						local template = "I have the following code from {{filename}}:\n\n"
							.. "```{{filetype}}\n{{selection}}\n```\n\n"
							.. "Please respond by writing table driven unit tests for the code above."
						local agent = gp.get_command_agent()
						gp.Prompt(params, gp.Target.vnew, agent, template)
					end,
					Explain = function(gp, params)
						local template = "I have the following code from {{filename}}:\n\n"
							.. "```{{filetype}}\n{{selection}}\n```\n\n"
							.. "Please respond by explaining the code above."

						local agent = gp.get_chat_agent()
						gp.Prompt(params, gp.Target.popup, agent, template)
					end,
					-- example of usig enew as a function specifying type for the new buffer
					CodeReview = function(gp, params)
						local template = "I have the following code from {{filename}}:\n\n"
							.. "```{{filetype}}\n{{selection}}\n```\n\n"
							.. "Please analyze for code smells and suggest improvements."
						local agent = gp.get_chat_agent()
						gp.Prompt(params, gp.Target.enew("markdown"), agent, template)
					end,
					-- example of making :%GpChatNew a dedicated command which
					-- opens new chat with the entire current buffer as a context
					BufferChatNew = function(gp, _)
						-- call GpChatNew command in range mode on whole buffer
						vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
					end,
				},
			})
		end,
	},
}
