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
}
