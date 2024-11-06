return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		opts = {},
	},
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jay-babu/mason-null-ls.nvim" },
		},
		config = function()
			local lsp_defaults = require('lspconfig').util.default_config
			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)
			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					local telescope = require("telescope.builtin")
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
					vim.keymap.set("n", "gt", telescope.lsp_type_definitions, opts)
					vim.keymap.set("n", "gr", telescope.lsp_references, opts)
					vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<Leader>.", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
				end,
			})

			require("null-ls").setup()
			require("mason-null-ls").setup({ handlers = {} })

			local buffer_autoformat = function(bufnr)
				local group = 'lsp_autoformat'
				vim.api.nvim_create_augroup(group, { clear = false })
				vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

				vim.api.nvim_create_autocmd('BufWritePre', {
					buffer = bufnr,
					group = group,
					desc = 'LSP format on save',
					callback = function()
						vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
					end,
				})
			end

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(event)
					local id = vim.tbl_get(event, 'data', 'client_id')
					local client = id and vim.lsp.get_client_by_id(id)
					if client == nil then
						return
					end

					if client.supports_method('textDocument/formatting') then
						buffer_autoformat(event.buf)
					end
				end
			})

			local lspconfig = require("lspconfig")

			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({})
					end,
					["clangd"] = function()
						lspconfig.clangd.setup({
							filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
						})
					end,
					["eslint"] = function()
						lspconfig.eslint.setup({
							experimental = {
								useFlatConfig = true
							},
						})
					end,
					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" }
									}
								}
							}
						})
					end,
					["rust_analyzer"] = function()
						lspconfig.rust_analyzer.setup({
							settings = {
								["rust-analyzer"] = {
									checkOnSave = {
										command = "clippy",
									}
								}
							}
						})
					end,
					["tailwindcss"] = function()
						lspconfig.tailwindcss.setup({
							settings = {
								tailwindCSS = {
									experimental = {
										classRegex = {
											{ "(?:twMerge|twJoin)\\(([^;]*)[\\);]", "[`'\"`]([^'\"`;]*)[`'\"`]" },
											{ "composeRenderProps\\(([^;]*)[\\);]", "[`'\"`]([^'\"`;]*)[`'\"`]" },
										},
									}
								}
							},
						})
					end,
					["ts_ls"] = function()
						lspconfig.ts_ls.setup({
							on_attach = function(client)
								client.server_capabilities.documentFormattingProvider = false
								client.server_capabilities.documentFormattingRangeProvider = false
							end
						})
					end
				},
			})
		end
	}
}
