return {
	{
		"stevearc/oil.nvim",
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		keys = { { "-", "<cmd>Oil --float<cr>", desc = "Open parent directory" } },
		lazy = false,
		---@module "oil"
		---@type oil.SetupOpts
		opts = {},
	},
}
