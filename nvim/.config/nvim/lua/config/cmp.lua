﻿local cmp = require 'cmp'

require 'cmp_nvim_lsp'
require 'cmp_buffer'
require 'cmp_nvim_lsp'
require 'cmp_nvim_lua'
-- require 'cmp_calc'
-- require 'cmp_emoji'
require 'cmp_luasnip'
-- require 'cmp_nvim_ultisnips'

require('luasnip/loaders/from_vscode').lazy_load()

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- fancy icons and a name of kind
			vim_item.kind = require('lspkind').presets.default[vim_item.kind] .. ' ' .. vim_item.kind

			-- set a name for each source
			vim_item.menu = ({
				buffer = '[Buffer]',
				path = '[Path]',
				nvim_lsp = '[LSP]',
				nvim_lua = '[Lua]',
				-- calc = '[Calc]',
				-- emoji = '[Emoji]',
				luasnip = '[LuaSnip]',
				-- ultisnips = '[UltiSnips]',
			})[entry.source.name]

			return vim_item
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		},
		-- ['<Tab>'] = cmp.mapping(function(fallback)
		-- 	if vim.fn.pumvisible() == 1 then
		-- 		vim.fn.feedkeys(t '<C-n>', 'n')
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, {
		-- 		'i',
		-- 		's',
		-- 	}),
		-- ['<S-Tab>'] = cmp.mapping(function(fallback)
		-- 	if vim.fn.pumvisible() == 1 then
		-- 		vim.fn.feedkeys(t '<C-p>', 'n')
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, {
		-- 		'i',
		-- 		's',
		-- 	}),
	},
	window = {
		documentation = {
			border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
		},
	},
	sources = {
		{ name = 'luasnip' },
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		-- { name = 'calc' },
		-- { name = 'emoji' },
	},
}
