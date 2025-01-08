return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
	{ "nvim-treesitter/nvim-treesitter-context", opts = { multiline_threshold = 1 } },
	{ "windwp/nvim-ts-autotag", opts = {} },
}
