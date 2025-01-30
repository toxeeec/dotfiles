return {
	{
		"tpope/vim-sleuth",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = { signs = false },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"haya14busa/vim-asterisk",
		init = function()
			vim.g["asterisk#keeppos"] = 1
		end,
		keys = {
			{ "*", "<plug>(asterisk-z*)zz", mode = { "n", "x" } },
			{ "#", "<plug>(asterisk-z#)", mode = { "n", "x" } },
			{ "g*", "<plug>(asterisk-gz*)", mode = { "n", "x" } },
			{ "g#", "<plug>(asterisk-gz#)", mode = { "n", "x" } },
		},
	},
}
