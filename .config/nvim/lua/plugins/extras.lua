return {
	{
		"numToStr/Comment.nvim",
		dependencies = {
			{ 'JoosepAlviste/nvim-ts-context-commentstring' }
		},
		keys = {
			"gcc", "gbc", "gc", "gb",
			{ "gc", mode = "v" },
			{ "gb", mode = "v" },
		},
		opts = function()
			return {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},
}
