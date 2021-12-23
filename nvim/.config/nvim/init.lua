vim.opt.compatible = false
vim.opt.history = 1000
vim.opt.mouse = 'a'
vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.errorbells = false
vim.opt.updatetime = 300
vim.opt.title = true
-- vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = '80,120'
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.encoding = 'utf-8'
vim.opt.bomb = true
vim.opt.startofline = false
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.switchbuf = 'useopen'
vim.opt.backspace = 'indent,eol,start'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.listchars = {
	tab =  '▏ ',
	trail =  '·',
}
vim.opt.list = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = 'split'
vim.opt.wildmenu = true
vim.opt.wildignore = {
	'*.bmp',
	'*.gif',
	'*.ico',
	'*.jpg',
	'*.png',
	'*.psd',
	'*.pdf',
	'.DS_Store',
	'.git/*',
	'node_modules/*',
	'bower_components/*',
}
vim.opt.synmaxcol = 120
vim.cmd[[
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
]]
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
-- vim.opt.cmdheight = 2
vim.opt.showtabline = 2
vim.opt.laststatus = 2
vim.opt.foldmethod = 'syntax'
-- vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.clipboard = vim.loop.os_uname().sysname == 'Linux' and 'unnamedplus' or 'unnamed'

vim.cmd[[
filetype plugin indent on
syntax on

augroup roh_highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]]

-- MAPS
----------------------------------------------------------------------------

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('', '<space>', '<nop>', opts)
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', 'Q', '<nop>', opts)
-- vim.api.nvim_set_keymap('n', 'Y', 'y$', opts)
-- vim.api.nvim_set_keymap('', '<Up>', '<nop>', opts)
-- vim.api.nvim_set_keymap('', '<Down>', '<nop>', opts)
-- vim.api.nvim_set_keymap('', '<Left>', '<nop>', opts)
-- vim.api.nvim_set_keymap('', '<Right>', '<nop>', opts)
-- vim.api.nvim_set_keymap('i', '<Up>', '<nop>', opts)
-- vim.api.nvim_set_keymap('i', '<Down>', '<nop>', opts)
-- vim.api.nvim_set_keymap('i', '<Left>', '<nop>', opts)
-- vim.api.nvim_set_keymap('i', '<Right>', '<nop>', opts)
vim.api.nvim_set_keymap('i', '<C-C>', '<esc>', opts)
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', opts)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', opts)
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts)
vim.api.nvim_set_keymap('n', '<A-j>', 'm +1<CR>==', opts)
vim.api.nvim_set_keymap('n', '<A-k>', 'm -2<CR>==', opts)
vim.api.nvim_set_keymap('i', '<A-j>', '<esc>:m +1<CR>==a', opts)
vim.api.nvim_set_keymap('i', '<A-k>', '<esc>:m -2<CR>==a', opts)
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', opts)
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', opts)
vim.api.nvim_set_keymap('i', ',', ',<C-g>u', opts)
vim.api.nvim_set_keymap('i', '.', '.<C-g>u', opts)
vim.api.nvim_set_keymap('i', '?', '?<C-g>u', opts)
vim.api.nvim_set_keymap('i', '!', '!<C-g>u', opts)
vim.api.nvim_set_keymap('n', '<C-L>', ':<C-u>let @/ = "" <Bar> nohl<CR><C-L>', opts)
vim.api.nvim_set_keymap('n', 'g/', '<C-u>%s//g<Left><Left>', opts)
vim.api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', opts)
vim.api.nvim_set_keymap('n', '<leader>j', ':<C-u>bprev<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>k', ':<C-u>bnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>h', ':<C-u>bfirst<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>l', ':<C-u>blast<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>d', ':<C-u>bwipeout<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>w', ':<C-u>w<cr>', opts)

function p_find_files()
	require('telescope.builtin').find_files({
		find_command = {'rg', '-g', '!.git', '--ignore', '--hidden', '--files'},
	})
end

function p_find_notes()
	require'telescope.builtin'.find_files({
		cwd = '/Users/reekoheek/Workspaces/notes',
	})
end

vim.api.nvim_set_keymap('n', '<leader>n', ':<C-u>lua p_find_notes()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>p', ':<C-u>lua p_find_files()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>f', ':<C-u>lua require("telescope.builtin").live_grep()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>e', ':<C-u>lua require("telescope.builtin").file_browser({ hidden = true })<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>e', ':<C-u>Explore<CR>', opts)

-- PLUGINS
----------------------------------------------------------------------------

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd'packadd packer.nvim'
end

vim.cmd[[
augroup roh_packer
	autocmd!
	autocmd BufWritePost init.lua source <afile> | PackerCompile
augroup end
]]

return require('packer').startup(function()
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim' }
	use {
		'airblade/vim-rooter',
		config = function()

			vim.cmd[[
			augroup roh_fix_autochdir
				autocmd!
				autocmd InsertEnter * set autochdir
				autocmd InsertLeave * set noautochdir | Rooter
			augroup END
			]]
		end,
	}
	use {
		'hoob3rt/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		after = 'gruvbox',
		config = function()
			require('lualine').setup({ theme = 'gruvbox' })
		end,
	}
	use {
		'akinsho/nvim-bufferline.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		after = 'gruvbox',
		config = function()
			require("bufferline").setup{}
		end,
	}
	use {
		'morhetz/gruvbox',
		config = function()
			vim.g.gruvbox_transparent_bg = 1
			vim.g.gruvbox_contrast_dark = 'hard'
			vim.cmd([[
			colorscheme gruvbox
			highlight Normal guibg=NONE ctermbg=NONE
			]])
		end,
	}
	-- use { 'sheerun/vim-polyglot' }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		after = 'gruvbox',
		event = 'BufRead',
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = 'maintained',
				indent = { enable = true },
				highlight = { enable = true }
			}
		end,
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		after = 'gruvbox',
		event = 'BufRead',
		config = function()
			require('gitsigns').setup()
		end,
	}
	use {
		'tpope/vim-surround',
		event = 'BufRead',
	}
	use {
		'tpope/vim-commentary',
		event = 'BufRead',
		config = function()
			vim.cmd[[
			augroup roh_fix_comments
				autocmd!
				autocmd FileType javascript setlocal commentstring=//\ %s
				autocmd FileType typescript setlocal commentstring=//\ %s
				autocmd FileType fish setlocal commentstring=#\ %s
			augroup end
			]]
		end,
	}
	use {
		'editorconfig/editorconfig-vim',
		event = 'BufRead',
	}
	use {
		'steelsojka/pears.nvim',
		event = 'BufRead',
		config = function()
			require 'pears'.setup()
		end,
	}
	use {
		'hrsh7th/nvim-cmp',
		event = 'BufRead',
		requires = {
			{ 'onsails/lspkind-nvim', module = 'lspkind' },
			{ 'hrsh7th/cmp-buffer', module = 'cmp_buffer' },
			{ 'hrsh7th/cmp-path', module = 'cmp_path' },
			{ 'hrsh7th/cmp-nvim-lsp', module = 'cmp_nvim_lsp' },
			{ 'hrsh7th/cmp-nvim-lua', module = 'cmp_nvim_lua' },
			-- { 'hrsh7th/cmp-calc', module = 'cmp_calc' },
			-- { 'hrsh7th/cmp-emoji', module = 'cmp_emoji' },
			{ 'rafamadriz/friendly-snippets' },
			{ 'L3MON4D3/LuaSnip', module = 'luasnip' },
			{ 'saadparwaiz1/cmp_luasnip', module = 'cmp_luasnip' },
		},
		config = function()
			require'config.cmp'
		end,
	}
	use {
		'neovim/nvim-lspconfig',
		after = 'nvim-cmp',
		config = function()
			require'config.lsp'
		end,
	}
	use {
		'mattn/emmet-vim',
		ft = {
			'html',
			'php',
			'jsp',
			'markdown',
			'javascript',
			'typescript',
		},
	}
	-- use {
	-- 	'fatih/vim-go',
	-- }
	use {
		'mfussenegger/nvim-jdtls',
		config = function()
			vim.cmd[[
			augroup roh_jdtlsp
				autocmd!
				autocmd FileType java lua require('jdtls').start_or_attach({ cmd = {'jdt-lsp'} })
			augroup end
			]]

			local finders = require'telescope.finders'
			local sorters = require'telescope.sorters'
			local actions = require'telescope.actions'
			local pickers = require'telescope.pickers'
			require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
				local opts = {}
				pickers.new(opts, {
					prompt_title = prompt,
					finder    = finders.new_table {
						results = items,
						entry_maker = function(entry)
							return {
								value = entry,
								display = label_fn(entry),
								ordinal = label_fn(entry),
							}
						end,
					},
					sorter = sorters.get_generic_fuzzy_sorter(),
					attach_mappings = function(prompt_bufnr)
						actions.select_default:replace(function()
							local selection = actions.get_selected_entry(prompt_bufnr)
							actions.close(prompt_bufnr)

							cb(selection.value)
						end)

						return true
					end,
				}):find()
			end
		end,
	}
	use { 'tpope/vim-dadbod' }
	use {
		'kristijanhusak/vim-dadbod-ui',
		-- config = function()
		-- 	vim.api.nvim_set_keymap('n', '<leader>x', ":DB<cr>", { noremap = true, silent = true })
		-- end
	}
	-- use {
	-- 	'jonsmithers/vim-html-template-literals',
	-- 	ft = {
	-- 		'javascript',
	-- 		'typescript',
	-- 	},
	-- 	requires = {
	-- 		'leafgarland/typescript-vim',
	-- 	},
	-- }
	use {
		'kana/vim-textobj-user',
		event = 'BufRead',
		config = function()
			vim.cmd[[source ~/.config/nvim/config/textobj.vim]]
		end,
	}
	use {
		'PeterRincker/vim-argumentative',
		event = 'BufRead',
		config = function()
			vim.api.nvim_set_keymap('n', '[a', '<Plug>Argumentative_Prev', { silent = true })
			vim.api.nvim_set_keymap('n', ']a', '<Plug>Argumentative_Next', { silent = true })
			vim.api.nvim_set_keymap('x', '[a', '<Plug>Argumentative_XPrev', { silent = true })
			vim.api.nvim_set_keymap('x', ']a', '<Plug>Argumentative_XNext', { silent = true })
			vim.api.nvim_set_keymap('n', '<a', '<Plug>Argumentative_MoveLeft', { silent = true })
			vim.api.nvim_set_keymap('n', '>a', '<Plug>Argumentative_MoveRight', { silent = true })
			vim.api.nvim_set_keymap('x', 'ia', '<Plug>Argumentative_InnerTextObject', { silent = true })
			vim.api.nvim_set_keymap('x', 'aa', '<Plug>Argumentative_OuterTextObject', { silent = true })
			vim.api.nvim_set_keymap('o', 'ia', '<Plug>Argumentative_OpPendingInnerTextObject', { silent = true })
			vim.api.nvim_set_keymap('o', 'aa', '<Plug>Argumentative_OpPendingOuterTextObject', { silent = true })
		end,
	}
	use {
		'NTBBloodbath/rest.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		ft = {
			'http',
			'rest',
		},
		config = function()
			require('rest-nvim').setup({
				-- Open request results in a horizontal split
				-- result_split_horizontal = false,
				-- Skip SSL verification, useful for unknown certificates
				-- skip_ssl_verification = false,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				-- result = {
				-- 	-- toggle showing URL, HTTP info, headers at top the of result window
				-- 	show_url = true,
				-- 	show_http_info = true,
				-- 	show_headers = true,
				-- },
				-- Jump to request line on run
				-- jump_to_request = false,
				-- env_file = '.env',
				-- custom_dynamic_variables = {},
			})

			vim.api.nvim_buf_set_keymap(0, 'n', '<leader>x', ':lua require("rest-nvim").run()<CR>', { noremap = true, silent = true })
		end
	}
	use {
		'github/copilot.vim',
		event = 'BufRead',
	}
	use {
		'nvim-telescope/telescope.nvim',
		module_pattern = 'telescope.*',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup({
				defaults = {
					layout_config = {
						prompt_position = 'top'
					},
					sorting_strategy = 'ascending',
					vimgrep_arguments = {
						'rg',
						'--ignore',
						'--hidden',
						'--color=never',
						'--no-heading',
						'--with-filename',
						'--line-number',
						'--column',
						'--smart-case'
					},
					prompt_prefix = '🔍',
				},
			})
		end,
	}
	use { 'dstein64/vim-startuptime' }
	use { 'farmergreg/vim-lastplace' }
	use { 'tpope/vim-obsession' } -- must be last
end)

