return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = { section_separators = "", component_separators = "" },
			sections = {
				lualine_b = { "branch", "diff", { "diagnostics", update_in_insert = true } },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "echasnovski/mini.bufremove" }
		},
		opts = function()
			return {
				options = {
					diagnostics = "nvim_lsp",
					diagnostics_update_in_insert = true,
					indicator = {
						style = "none"
					},
					style_preset = {
						require("bufferline").style_preset.no_italic
					},
					show_buffer_icons = false,
					show_buffer_close_icons = false,
					separator_style = { "", "" },
				},
			}
		end,
		config = function(_, opts)
			require("bufferline").setup(opts)

			for i = 1, 9 do
				vim.keymap.set("n", string.format("<A-%s>", i), string.format("<cmd>BufferLineGoTo %s<cr>", i))
			end
			vim.keymap.set("n", "<C-w>", require("mini.bufremove").delete)
		end,
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "stevearc/dressing.nvim",      event = "VeryLazy" },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
	},
}
