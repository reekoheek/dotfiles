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
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    after = { "gitsigns.nvim", "lualine.nvim", "nvim-treesitter", "nvim-bufferline.lua" },
    loaded = true,
    only_config = true
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/lexima.vim",
    url = "https://github.com/cohama/lexima.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ntheme\fgruvbox\nsetup\flualine\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.compe\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/nvim-compe",
    url = "https://github.com/hrsh7th/nvim-compe"
  },
  ["nvim-jdtls"] = {
    config = { "\27LJ\2\nN\0\1\5\1\4\0\v5\1\0\0=\0\1\1-\2\0\0\18\4\0\0B\2\2\2=\2\2\1-\2\0\0\18\4\0\0B\2\2\2=\2\3\1L\1\2\0\2¿\fordinal\fdisplay\nvalue\1\0\0\\\0\0\4\3\3\0\f-\0\0\0009\0\0\0-\2\1\0B\0\2\2-\1\0\0009\1\1\1-\3\1\0B\1\2\1-\1\2\0009\3\2\0B\1\2\1K\0\1\0\0\0\0¿\1\0\nvalue\nclose\23get_selected_entryG\1\1\5\2\3\0\t-\1\0\0009\1\0\1\18\3\1\0009\1\1\0013\4\2\0B\1\3\1+\1\2\0002\0\0ÄL\1\2\0\3\0\3¿\0\freplace\19select_defaultÍ\1\1\4\r\4\14\0\0264\4\0\0-\5\0\0009\5\0\5\18\a\4\0005\b\1\0=\1\2\b-\t\1\0009\t\3\t5\v\4\0=\0\5\v3\f\6\0=\f\a\vB\t\2\2=\t\b\b-\t\2\0009\t\t\tB\t\1\2=\t\n\b3\t\v\0=\t\f\bB\5\3\2\18\a\5\0009\5\r\5B\5\2\0012\0\0ÄK\0\1\0\3¿\0¿\1¿\2¿\tfind\20attach_mappings\0\vsorter\29get_generic_fuzzy_sorter\vfinder\16entry_maker\0\fresults\1\0\0\14new_table\17prompt_title\1\0\0\bnew·\2\1\0\a\0\v\0\0236\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0026\1\3\0'\3\5\0B\1\2\0026\2\3\0'\4\6\0B\2\2\0026\3\3\0'\5\a\0B\3\2\0026\4\3\0'\6\b\0B\4\2\0023\5\n\0=\5\t\0042\0\0ÄK\0\1\0\0\19pick_one_async\rjdtls.ui\22telescope.pickers\22telescope.actions\22telescope.sorters\22telescope.finders\frequireê\1\t\t\taugroup roh_jdtlsp\n\t\t\t\tautocmd!\n\t\t\t\tautocmd FileType java lua require('jdtls').start_or_attach({ cmd = {'jdt-lsp'} })\n\t\t\taugroup end\n\t\t\t\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-compe" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nü\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\vindent\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\nÎ\1\0\0\a\0\r\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0)\2\0\0'\3\t\0'\4\n\0'\5\v\0005\6\f\0B\0\6\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2(:lua require(\"rest-nvim\").run()<CR>\14<leader>x\6n\24nvim_buf_set_keymap\bapi\bvim\14highlight\1\0\0\1\0\2\fenabled\2\ftimeout\3ñ\1\nsetup\14rest-nvim\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nØ\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\rdefaults\1\0\0\22vimgrep_arguments\1\n\0\0\arg\r--ignore\r--hidden\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\18layout_config\1\0\2\18prompt_prefix\tüîç\21sorting_strategy\14ascending\1\0\1\20prompt_position\btop\nsetup\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-argumentative"] = {
    config = { "\27LJ\2\n¨\6\0\0\6\0 \0Q6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\4\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\a\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\18\0'\4\19\0005\5\20\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\27\0'\3\21\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\27\0'\3\24\0'\4\30\0005\5\31\0B\0\5\1K\0\1\0\1\0\1\vsilent\0021<Plug>Argumentative_OpPendingOuterTextObject\1\0\1\vsilent\0021<Plug>Argumentative_OpPendingInnerTextObject\6o\1\0\1\vsilent\2(<Plug>Argumentative_OuterTextObject\aaa\1\0\1\vsilent\2(<Plug>Argumentative_InnerTextObject\aia\1\0\1\vsilent\2\"<Plug>Argumentative_MoveRight\a>a\1\0\1\vsilent\2!<Plug>Argumentative_MoveLeft\a<a\1\0\1\vsilent\2\30<Plug>Argumentative_XNext\1\0\1\vsilent\2\30<Plug>Argumentative_XPrev\6x\1\0\1\vsilent\2\29<Plug>Argumentative_Next\a]a\1\0\1\vsilent\2\29<Plug>Argumentative_Prev\a[a\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/vim-argumentative",
    url = "https://github.com/PeterRincker/vim-argumentative"
  },
  ["vim-commentary"] = {
    config = { "\27LJ\2\nì\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Û\1\t\t\taugroup roh_fix_comments\n\t\t\t\tautocmd!\n\t\t\t\tautocmd FileType javascript setlocal commentstring=//\\ %s\n\t\t\t\tautocmd FileType typescript setlocal commentstring=//\\ %s\n\t\t\t\tautocmd FileType fish setlocal commentstring=#\\ %s\n\t\t\taugroup end\n\t\t\t\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\nº\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0ú\1\t\t\taugroup roh_fix_autochdir\n\t\t\t\tautocmd!\n\t\t\t\tautocmd InsertEnter * set autochdir\n\t\t\t\tautocmd InsertLeave * set noautochdir | Rooter\n\t\t\taugroup END\n\t\t\t\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-user"] = {
    config = { "\27LJ\2\nL\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0-source ~/.config/nvim/config/textobj.vim\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/reekoheek/.local/share/nvim/site/pack/packer/opt/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
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

-- Config for: nvim-jdtls
time([[Config for nvim-jdtls]], true)
try_loadstring("\27LJ\2\nN\0\1\5\1\4\0\v5\1\0\0=\0\1\1-\2\0\0\18\4\0\0B\2\2\2=\2\2\1-\2\0\0\18\4\0\0B\2\2\2=\2\3\1L\1\2\0\2¿\fordinal\fdisplay\nvalue\1\0\0\\\0\0\4\3\3\0\f-\0\0\0009\0\0\0-\2\1\0B\0\2\2-\1\0\0009\1\1\1-\3\1\0B\1\2\1-\1\2\0009\3\2\0B\1\2\1K\0\1\0\0\0\0¿\1\0\nvalue\nclose\23get_selected_entryG\1\1\5\2\3\0\t-\1\0\0009\1\0\1\18\3\1\0009\1\1\0013\4\2\0B\1\3\1+\1\2\0002\0\0ÄL\1\2\0\3\0\3¿\0\freplace\19select_defaultÍ\1\1\4\r\4\14\0\0264\4\0\0-\5\0\0009\5\0\5\18\a\4\0005\b\1\0=\1\2\b-\t\1\0009\t\3\t5\v\4\0=\0\5\v3\f\6\0=\f\a\vB\t\2\2=\t\b\b-\t\2\0009\t\t\tB\t\1\2=\t\n\b3\t\v\0=\t\f\bB\5\3\2\18\a\5\0009\5\r\5B\5\2\0012\0\0ÄK\0\1\0\3¿\0¿\1¿\2¿\tfind\20attach_mappings\0\vsorter\29get_generic_fuzzy_sorter\vfinder\16entry_maker\0\fresults\1\0\0\14new_table\17prompt_title\1\0\0\bnew·\2\1\0\a\0\v\0\0236\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0026\1\3\0'\3\5\0B\1\2\0026\2\3\0'\4\6\0B\2\2\0026\3\3\0'\5\a\0B\3\2\0026\4\3\0'\6\b\0B\4\2\0023\5\n\0=\5\t\0042\0\0ÄK\0\1\0\0\19pick_one_async\rjdtls.ui\22telescope.pickers\22telescope.actions\22telescope.sorters\22telescope.finders\frequireê\1\t\t\taugroup roh_jdtlsp\n\t\t\t\tautocmd!\n\t\t\t\tautocmd FileType java lua require('jdtls').start_or_attach({ cmd = {'jdt-lsp'} })\n\t\t\taugroup end\n\t\t\t\bcmd\bvim\0", "config", "nvim-jdtls")
time([[Config for nvim-jdtls]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
try_loadstring("\27LJ\2\nº\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0ú\1\t\t\taugroup roh_fix_autochdir\n\t\t\t\tautocmd!\n\t\t\t\tautocmd InsertEnter * set autochdir\n\t\t\t\tautocmd InsertLeave * set noautochdir | Rooter\n\t\t\taugroup END\n\t\t\t\bcmd\bvim\0", "config", "vim-rooter")
time([[Config for vim-rooter]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\2\næ\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0K\t\t\tcolorscheme gruvbox\n\t\t\thighlight Normal guibg=NONE ctermbg=NONE\n\t\t\t\bcmd\thard\26gruvbox_contrast_dark\27gruvbox_transparent_bg\6g\bvim\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-bufferline.lua ]]

-- Config for: nvim-bufferline.lua
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")

vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ntheme\fgruvbox\nsetup\flualine\frequire\0", "config", "lualine.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType rest ++once lua require("packer.load")({'rest.nvim'}, { ft = "rest" }, _G.packer_plugins)]]
vim.cmd [[au FileType http ++once lua require("packer.load")({'rest.nvim'}, { ft = "http" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'emmet-vim'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsp ++once lua require("packer.load")({'emmet-vim'}, { ft = "jsp" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'emmet-vim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'vim-commentary', 'editorconfig-vim', 'nvim-treesitter', 'vim-textobj-user', 'vim-surround', 'vim-argumentative'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/reekoheek/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], true)
vim.cmd [[source /Users/reekoheek/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]]
time([[Sourcing ftdetect script at: /Users/reekoheek/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
