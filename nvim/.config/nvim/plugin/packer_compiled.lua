-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/reekoheek/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/reekoheek/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/reekoheek/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/reekoheek/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/reekoheek/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["editorconfig-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  gruvbox = {
    after = { "gitsigns.nvim", "nvim-bufferline.lua", "nvim-treesitter", "lualine.nvim" },
    loaded = true,
    only_config = true
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ntheme\fgruvbox\nsetup\flualine\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.compe\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-compe" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nŸ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\vindent\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¯\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\rdefaults\1\0\0\22vimgrep_arguments\1\n\0\0\arg\r--ignore\r--hidden\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\18layout_config\1\0\2\18prompt_prefix\tðŸ”\21sorting_strategy\14ascending\1\0\1\20prompt_position\btop\nsetup\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-argumentative"] = {
    config = { "\27LJ\2\n¬\6\0\0\6\0 \0Q6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\4\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\a\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\18\0'\4\19\0005\5\20\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\27\0'\3\21\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\27\0'\3\24\0'\4\30\0005\5\31\0B\0\5\1K\0\1\0\1\0\1\vsilent\0021<Plug>Argumentative_OpPendingOuterTextObject\1\0\1\vsilent\0021<Plug>Argumentative_OpPendingInnerTextObject\6o\1\0\1\vsilent\2(<Plug>Argumentative_OuterTextObject\aaa\1\0\1\vsilent\2(<Plug>Argumentative_InnerTextObject\aia\1\0\1\vsilent\2\"<Plug>Argumentative_MoveRight\a>a\1\0\1\vsilent\2!<Plug>Argumentative_MoveLeft\a<a\1\0\1\vsilent\2\30<Plug>Argumentative_XNext\1\0\1\vsilent\2\30<Plug>Argumentative_XPrev\6x\1\0\1\vsilent\2\29<Plug>Argumentative_Next\a]a\1\0\1\vsilent\2\29<Plug>Argumentative_Prev\a[a\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/vim-argumentative"
  },
  ["vim-commentary"] = {
    config = { "\27LJ\2\n“\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0ó\1\t\t\taugroup roh_fix_comments\n\t\t\t\tautocmd!\n\t\t\t\tautocmd FileType javascript setlocal commentstring=//\\ %s\n\t\t\t\tautocmd FileType typescript setlocal commentstring=//\\ %s\n\t\t\t\tautocmd FileType fish setlocal commentstring=#\\ %s\n\t\t\taugroup end\n\t\t\t\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-html-template-literals"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/vim-html-template-literals"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["vim-textobj-user"] = {
    config = { "\27LJ\2\nL\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0-source ~/.config/nvim/config/textobj.vim\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/vim-textobj-user"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["telescope.*"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\2\n¾\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0K\t\t\tcolorscheme gruvbox\n\t\t\thighlight Normal guibg=NONE ctermbg=NONE\n\t\t\t\bcmd\thard\26gruvbox_contrast_dark\27gruvbox_transparent_bg\6g\bvim\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ntheme\fgruvbox\nsetup\flualine\frequire\0", "config", "lualine.nvim")

vim.cmd [[ packadd nvim-bufferline.lua ]]

-- Config for: nvim-bufferline.lua
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-html-template-literals', 'emmet-vim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-html-template-literals', 'emmet-vim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'emmet-vim'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsp ++once lua require("packer.load")({'emmet-vim'}, { ft = "jsp" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'emmet-vim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-surround', 'vim-textobj-user', 'editorconfig-vim', 'gitsigns.nvim', 'vim-argumentative', 'nvim-treesitter', 'vim-commentary'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
