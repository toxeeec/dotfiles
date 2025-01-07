return {
	{
		"folke/tokyonight.nvim",
		init = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
		priority = 1000,
	},
}
