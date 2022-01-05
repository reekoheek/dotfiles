local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown' }
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
-- 	properties = {
-- 		'documentation',
-- 		'detail',
-- 		'additionalTextEdits',
-- 	},
-- }
-- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities());

local servers = {
	jdtls = {
		cmd = { 'jdtls' },
		root_dir = function(fname)
			return lspconfig.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
		end,
	},
	tsserver = {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
		end
	},
	eslint = {},
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
	html = {},
	cssls = {},
	intelephense = { root_dir = vim.loop.cwd },
	gopls = {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			function goimports(timeoutms)
				local context = { source = { organizeImports = true } }
				vim.validate { context = { context, "t", true } }

				local params = vim.lsp.util.make_range_params()
				params.context = context

				local method = "textDocument/codeAction"
				local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
				if resp and resp[1] then
					local result = resp[1].result
					if result and result[1] then
						local edit = result[1].edit
						vim.lsp.util.apply_workspace_edit(edit)
					end
				end

				vim.lsp.buf.formatting()
			end

			vim.cmd[[
			augroup roh_goimports
			au!
			autocmd BufWritePre *.go lua goimports(1000)
			augroup END
			]]
		end,
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
	pyright = {},
	-- ['null-ls'] = {
	-- 	pre_init = function(client)
	-- 	end,
	-- },
}

for name, opts in pairs(servers) do
	if type(opts) == 'function' then
		opts()
	else
		local on_attach = function(client, bufnr)
			if opts.on_attach then
				opts.on_attach(client, bufnr)
			end

			if client.resolved_capabilities.code_lens then
				vim.cmd [[
				augroup roh_codelens
				au!
				au InsertEnter,InsertLeave * lua vim.lsp.codelens.refresh()
				augroup END
				]]
			end

			local options = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':<C-u>lua require[[telescope.builtin]].lsp_references()<CR>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua require[[telescope.builtin]].lsp_implementations()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader><cr>', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', options)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', options)

			-- require 'lsp_signature'.on_attach()
		end

		local on_init = function(client)
			if opts.on_init then
				opts.on_init(client)
			end
			-- vim.notify('Language Server Client successfully started!', 'info', {
			-- 	title = client.name,
			-- })
		end

		if opts.pre_init then
			opts.pre_init()
		end

		local client = lspconfig[name]
		client.setup(vim.tbl_extend('force', {
			-- flags = { debounce_text_changes = 150 },
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
		}, opts))
	end
end

