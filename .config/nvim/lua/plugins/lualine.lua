return {

	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = { section_separators = "", component_separators = "" },
			sections = {
				lualine_x = { "filetype" },
				lualine_y = {},
			},
		},
	},
}
