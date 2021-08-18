local lspconfig = require "lspconfig"

require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	resolve_timeout = 800;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = {
		border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 120,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1,
	};

	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		-- vsnip = true;
		ultisnips = true;
		luasnip = true;
	};
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local servers = {
	tsserver = {
		init_options = { documentFormatting = false },
		root_dir = vim.loop.cwd,
	},
	jsonls = {
		-- cmd = { "vscode-json-languageserver", "--stdio" },
		filetypes = { "json", "jsonc" },
		settings = {
			json = {
				schemas = {
					{
						fileMatch = { "package.json" },
						url = "https://json.schemastore.org/package.json",
					},
					{
						fileMatch = { "jsconfig*.json" },
						url = "https://json.schemastore.org/jsconfig.json",
					},
					{
						fileMatch = { "tsconfig*.json" },
						url = "https://json.schemastore.org/tsconfig.json",
					},
					{
						fileMatch = {
							".prettierrc",
							".prettierrc.json",
							"prettier.config.json",
						},
						url = "https://json.schemastore.org/prettierrc.json",
					},
					{
						fileMatch = { ".eslintrc", ".eslintrc.json" },
						url = "https://json.schemastore.org/eslintrc.json",
					},
					{
						fileMatch = { "nodemon.json" },
						url = "https://json.schemastore.org/nodemon.json",
					},
				},
			},
		},
	},
	-- svelte = require("modules.lsp.svelte").config,
	html = {},
	cssls = {},
	intelephense = { root_dir = vim.loop.cwd },
	-- clangd = {},
	-- rnix = {},
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
	-- pyright = {},
	-- texlab = {},
	["null-ls"] = {},
}

local null_ls = require "null-ls"
local b = null_ls.builtins

vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath "config" .. "/.prettierrc"

null_ls.config {
	debounce = 150,
	sources = {
		b.diagnostics.eslint.with {
			command = "eslint_d",
		},
		b.formatting.stylua.with {
			args = {
				"--config-path",
				vim.fn.stdpath "config" .. "/stylua.toml",
				"-",
			},
		},
		b.formatting.prettierd.with {
			filetypes = {
				"typescriptreact",
				"typescript",
				"javascriptreact",
				"javascript",
				"svelte",
				"json",
				"jsonc",
				"css",
				"html",
			},
		},
	},
}

for name, opts in pairs(servers) do
	if type(opts) == "function" then
		opts()
	else
		local on_attach = function(client)
			if client.name == "tsserver" then
				client.resolved_capabilities.document_formatting = false
			end

			if client.resolved_capabilities.code_lens then
				vim.cmd [[
			augroup CodeLens
				au!
				au InsertEnter,InsertLeave * lua vim.lsp.codelens.refresh()
			augroup END
			]]
			end

			require "lsp_signature".on_attach()

			-- inoremap { "<C-s>", vim.lsp.buf.signature_help, { silent = true } }
			-- nnoremap { "K", vim.lsp.buf.hover, { silent = true } }
			-- nnoremap { "<Leader>ga", telescope.lsp_code_actions, { silent = true } }
			-- nnoremap { "<Leader>gf", vim.lsp.buf.formatting_seq_sync, { silent = true } }
			-- vnoremap { "<Leader>gf", vim.lsp.buf.range_formatting, { silent = true } }
			-- nnoremap { "<Leader>gd", vim.lsp.buf.definition, { silent = true } }
			-- nnoremap { "<Leader>gl", vim.lsp.codelens.run, { silent = true } }
			-- nnoremap {
			-- 	"<Leader>gD",
			-- 	function()
			-- 		vim.lsp.diagnostic.show_line_diagnostics {
			-- 			show_header = false,
			-- 			border = Util.borders,
			-- 			}
			-- 	end,
			-- 	{ silent = true },
			-- 	}
			-- nnoremap { "<Leader>gr", telescope.lsp_references, { silent = true } }
			-- nnoremap { "<Leader>gR", vim.lsp.buf.rename, { silent = true } }
			-- nnoremap {
			-- 	"<Leader>g]",
			-- 	function()
			-- 		vim.lsp.diagnostic.goto_next {
			-- 			popup_opts = {
			-- 				show_header = false,
			-- 				border = Util.borders,
			-- 				},
			-- 			}
			-- 	end,
			-- 	{ silent = true },
			-- 	}
			-- nnoremap {
			-- 	"<Leader>g[",
			-- 	function()
			-- 		vim.lsp.diagnostic.goto_prev {
			-- 			popup_opts = {
			-- 				show_header = false,
			-- 				border = Util.borders,
			-- 				},
			-- 			}
			-- 	end,
			-- 	{ silent = true },
			-- 	}
		end

		local on_init = function(client)
			vim.notify("Language Server Client successfully started!", "info", {
					title = client.name,
				})
		end

		local client = lspconfig[name]
		client.setup(vim.tbl_extend("force", {
					flags = { debounce_text_changes = 150 },
					on_attach = on_attach,
					on_init = on_init,
					capabilities = capabilities,
			}, opts))
	end
end

vim.cmd([[
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gr :lua require'telescope.builtin'.lsp_references()<cr>
nnoremap <silent> ]g :lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent> [g :lua vim.lsp.diagnostic.goto_prev()<cr>
]])
