return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		config = function()
			require("lsp-zero.settings").preset({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jay-babu/mason-null-ls.nvim" },
		},
		config = function()
			local lsp = require("lsp-zero")

			lsp.on_attach(function(_, bufnr)
				lsp.buffer_autoformat()
				local opts = { buffer = bufnr }
				local telescope = require("telescope.builtin")
				vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
				vim.keymap.set("n", "gt", telescope.lsp_type_definitions, opts)
				vim.keymap.set("n", "gr", telescope.lsp_references, opts)
				vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, opts)
				-- vim.keymap.set("n", "<Leader>s", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<Leader>.", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
				-- vim.keymap.set("n", "<Leader>c", vim.diagnostic.setloclist, opts)
			end)

			lsp.configure("clangd", {
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
			})
			lsp.configure("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			})
			lsp.configure("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						}
					}
				}
			})
			lsp.configure("tailwindcss", {
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = { "[a-zA-Z]+ClassName=\"([^\"]*)\"" },
						}
					}
				},
			})
			lsp.configure("tsserver", {
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentFormattingRangeProvider = false
				end
			})

			lsp.setup()
			vim.diagnostic.config({ update_in_insert = true })

			require("null-ls").setup()
			require("mason-null-ls").setup({ handlers = {} })
		end,
	},
}
