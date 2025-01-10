return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.jump").setup()
			require("mini.move").setup()
			require("mini.surround").setup()
			require("mini.trailspace").setup()
		end,
	},
}
