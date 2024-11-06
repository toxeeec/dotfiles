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
	},
	config = function(_, opts)
		require('nvim-ts-autotag').setup({
			opts = {
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false -- Auto close on trailing </
			},
		})
		require("nvim-treesitter.configs").setup(opts)
	end,
}
