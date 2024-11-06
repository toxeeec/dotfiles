return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdLineEnter" },
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ 'saadparwaiz1/cmp_luasnip' }
	},
	config = function()
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done()
		)

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				['<Tab>'] = cmp.mapping(function(fallback)
					local luasnip = require('luasnip')
					local col = vim.fn.col('.') - 1

					if cmp.visible() then
						cmp.select_next_item({ behavior = 'select' })
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
						fallback()
					else
						cmp.complete()
					end
				end, { 'i', 's' }),

				-- Super shift tab
				['<S-Tab>'] = cmp.mapping(function(fallback)
					local luasnip = require('luasnip')

					if cmp.visible() then
						cmp.select_prev_item({ behavior = 'select' })
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
			}, {
				{ name = 'buffer' },
			})
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } }
		})
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } })
		})
	end,
}
