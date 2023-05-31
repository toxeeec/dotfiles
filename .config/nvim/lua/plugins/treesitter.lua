return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-context",    opts = {} },
		{ 'JoosepAlviste/nvim-ts-context-commentstring' }
	},
	opts = {
		highlight = { enable = true },
		ensure_installed = "all",
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		}
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
