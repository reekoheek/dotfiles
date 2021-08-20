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
vim.opt.relativenumber = true
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
vim.opt.synmaxcol = 2500
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
vim.opt.foldlevelstart = 99
vim.opt.completeopt = 'menuone,noselect'
vim.opt.clipboard = vim.loop.os_uname().sysname == 'Linux' and 'unnamedplus' or 'unnamed'

vim.cmd[[
filetype plugin indent on
syntax on

augroup roh_fix_autochdir
	autocmd!
	autocmd InsertEnter * let g:cwd = getcwd() | set autochdir
	autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(g:cwd)
augroup end

augroup roh_highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]]

-- MAPS
----------------------------------------------------------------------------

local options = { noremap = true, silent = true }

vim.api.nvim_set_keymap('', '<space>', '<nop>', options)
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', 'Q', '<nop>', options)
vim.api.nvim_set_keymap('n', 'Y', 'y$', options)
vim.api.nvim_set_keymap('', '<Up>', '<nop>', options)
vim.api.nvim_set_keymap('', '<Down>', '<nop>', options)
vim.api.nvim_set_keymap('', '<Left>', '<nop>', options)
vim.api.nvim_set_keymap('', '<Right>', '<nop>', options)
vim.api.nvim_set_keymap('i', '<Up>', '<nop>', options)
vim.api.nvim_set_keymap('i', '<Down>', '<nop>', options)
vim.api.nvim_set_keymap('i', '<Left>', '<nop>', options)
vim.api.nvim_set_keymap('i', '<Right>', '<nop>', options)
vim.api.nvim_set_keymap('i', '<C-C>', '<esc>', options)
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', options)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', options)
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', options)
vim.api.nvim_set_keymap('n', '<A-j>', 'm +1<CR>==', options)
vim.api.nvim_set_keymap('n', '<A-k>', 'm -2<CR>==', options)
vim.api.nvim_set_keymap('i', '<A-j>', '<esc>:m +1<CR>==a', options)
vim.api.nvim_set_keymap('i', '<A-k>', '<esc>:m -2<CR>==a', options)
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', options)
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', options)
vim.api.nvim_set_keymap('i', ',', ',<C-g>u', options)
vim.api.nvim_set_keymap('i', '.', '.<C-g>u', options)
vim.api.nvim_set_keymap('i', '?', '?<C-g>u', options)
vim.api.nvim_set_keymap('i', '!', '!<C-g>u', options)
vim.api.nvim_set_keymap('n', '<C-L>', ':<C-u>let @/ = "" <Bar> nohl<CR><C-L>', options)
vim.api.nvim_set_keymap('n', 'g/', '<C-u>%s//g<Left><Left>', options)
vim.api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', options)
vim.api.nvim_set_keymap('n', '<leader>j', ':<C-u>bprev<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>k', ':<C-u>bnext<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>h', ':<C-u>bfirst<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>l', ':<C-u>blast<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>d', ':<C-u>bd<cr>', options)

function p_find_files()
	require('telescope.builtin').find_files({
		find_command = {'rg', '-g', '!.git', '--ignore', '--hidden', '--files'},
	})
end

local options = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>p', ':<C-u>lua p_find_files()<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>f', ':<C-u>lua require("telescope.builtin").live_grep()<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>e', ':<C-u>lua require("telescope.builtin").file_browser({ hidden = true })<CR>', options)
vim.api.nvim_set_keymap('n', 'gr', ':<C-u>lua require[[telescope.builtin]].lsp_references()<CR>', options)

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
		'hoob3rt/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		after = 'gruvbox',
		-- event = 'VimEnter',
		config = function()
			require('lualine').setup({ theme = 'gruvbox' })
		end,
	}
	use {
		'akinsho/nvim-bufferline.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		after = 'gruvbox',
		-- event = 'VimEnter',
		config = function()
			require("bufferline").setup{}
		end,
	}
	use {
		'morhetz/gruvbox',
		-- event = 'VimEnter',
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
	-- 	'neoclide/coc.nvim',
	-- 	branch = 'release',
	-- 	config = function()
	-- 		vim.cmd[[
	-- 		source ~/.config/nvim/config/coc.vim
	-- 		]]
	-- 	end,
	-- }
	use {
		'neovim/nvim-lspconfig',
		requires = {
			'jose-elias-alvarez/null-ls.nvim',
		},
		config = function()
			require'config.lsp'
		end,
	}
	use {
		'hrsh7th/nvim-compe',
		after = {
			'nvim-lspconfig',
		},
		requires = {
			'ray-x/lsp_signature.nvim',
			'SirVer/ultisnips',
			'cohama/lexima.vim',
		},
		event = 'InsertEnter',
		config = function()
			require'config.compe'
		end,
	}
	use {
		'jonsmithers/vim-html-template-literals',
		ft = {
			'javascript',
			'typescript',
		},
	}
	-- use { 'kevinoid/vim-jsonc' }
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

