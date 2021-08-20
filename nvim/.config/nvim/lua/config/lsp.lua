local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	},
}

local servers = {
	tsserver = {
		init_options = { documentFormatting = false },
		root_dir = vim.loop.cwd,
	},
	jsonls = {
		filetypes = { 'json', 'jsonc' },
		settings = {
			json = {
				schemas = {
					{
						fileMatch = { 'package.json' },
						url = 'https://json.schemastore.org/package.json',
					},
					{
						fileMatch = { 'jsconfig*.json' },
						url = 'https://json.schemastore.org/jsconfig.json',
					},
					{
						fileMatch = { 'tsconfig*.json' },
						url = 'https://json.schemastore.org/tsconfig.json',
					},
					{
						fileMatch = {
							'.prettierrc',
							'.prettierrc.json',
							'prettier.config.json',
						},
						url = 'https://json.schemastore.org/prettierrc.json',
					},
					{
						fileMatch = { '.eslintrc', '.eslintrc.json' },
						url = 'https://json.schemastore.org/eslintrc.json',
					},
					{
						fileMatch = { 'nodemon.json' },
						url = 'https://json.schemastore.org/nodemon.json',
					},
				},
			},
		},
	},
	-- svelte = require('modules.lsp.svelte').config,
	html = {},
	cssls = {},
	intelephense = { root_dir = vim.loop.cwd },
	-- clangd = {},
	gopls = {
		settings = {
			gopls = {
				codelenses = {
					references = true,
					test = true,
					tidy = true,
					upgrade_dependency = true,
					generate = true,
				},
				gofumpt = true,
			},
		},
	},
	vimls = {},
	-- jdtls = { cmd = { 'jdtls' } },
	jdtls = {},
	-- pyright = {},
	['null-ls'] = {},
}

local null_ls = require 'null-ls'
local b = null_ls.builtins

vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath 'config' .. '/.prettierrc'

null_ls.config {
	debounce = 150,
	sources = {
		b.diagnostics.eslint.with {
			command = 'eslint_d',
		},
		b.formatting.stylua.with {
			args = {
				'--config-path',
				vim.fn.stdpath 'config' .. '/stylua.toml',
				'-',
			},
		},
		b.formatting.prettierd.with {
			filetypes = {
				'typescriptreact',
				'typescript',
				'javascriptreact',
				'javascript',
				'svelte',
				'json',
				'jsonc',
				'css',
				'html',
			},
		},
	},
}

for name, opts in pairs(servers) do
	if type(opts) == 'function' then
		opts()
	else
		local on_attach = function(client)
			if client.name == 'tsserver' then
				client.resolved_capabilities.document_formatting = false
			end

			if client.resolved_capabilities.code_lens then
				vim.cmd [[
			augroup roh_codelens
				au!
				au InsertEnter,InsertLeave * lua vim.lsp.codelens.refresh()
	 		augroup END
			]]
			end

			require 'lsp_signature'.on_attach()
		end

		local on_init = function(client)
			vim.notify('Language Server Client successfully started!', 'info', {
					title = client.name,
				})
		end

		local client = lspconfig[name]
		client.setup(vim.tbl_extend('force', {
					flags = { debounce_text_changes = 150 },
					on_attach = on_attach,
					on_init = on_init,
					capabilities = capabilities,
			}, opts))
	end
end

vim.cmd([[
nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gd :lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> ]g :lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent> [g :lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> K :lua vim.lsp.buf.hover{}<cr>
nnoremap <silent> <leader><cr> :lua require('telescope.builtin').lsp_code_actions()<cr>
]])
