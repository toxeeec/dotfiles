return {
	{
		"tpope/vim-sleuth",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
