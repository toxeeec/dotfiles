return {
	"linux-cultist/venv-selector.nvim",
	lazy = false,
	branch = "regexp",
	config = function()
		require("venv-selector").setup({
			settings = {
				search = {
					my_venvs = {
						command = "find ~/Library/Caches/pypoetry/virtualenvs -name python"
					}
				}
			}
		})
	end,
	keys = {
		{ ",v", "<cmd>VenvSelect<cr>" },
	},
}
