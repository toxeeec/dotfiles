return {
	{
		"folke/tokyonight.nvim",
		init = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
		opts = {
			style = "night",
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
			},
		},
		priority = 1000,
	},
}
