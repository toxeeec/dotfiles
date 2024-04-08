return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				multiline_threshold = 1
			}
		},
		{ "windwp/nvim-ts-autotag" },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
	},
	opts = {
		highlight = { enable = true },
		ensure_installed = "all",
		autotag = {
			enable = true,
			enable_close_on_slash = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
