return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		init = function()
			require("fzf-lua").register_ui_select()
		end,
		keys = {
			{ "<leader>sf", "<cmd>FzfLua files<cr>", desc = "[S]earch [F]iles" },
			{ "<leader>sb", "<cmd>FzfLua buffers<cr>", desc = "[S]earch [B]uffers" },
			{ "<leader>sh", "<cmd>FzfLua helptags<cr>", desc = "[S]earch [H]elp" },
			{
				"<leader>sn",
				function()
					require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "[S]earch [N]eovim files",
			},
			{ "<leader>lg", "<cmd>FzfLua live_grep_native<cr>", desc = "[L]ive [G]rep" },
		},
		opts = {
			fzf_opts = { ["--cycle"] = true },
			lsp = {
				jump_to_single_result = true,
			},
			keymap = {
				fzf = {
					true,
					["ctrl-q"] = "accept",
				},
			},
		},
	},
}
