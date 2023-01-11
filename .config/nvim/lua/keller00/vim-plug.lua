local config_home = vim.fn.stdpath('config')
local plug_path = config_home .. '/lua/plug.lua'
local plug_url = 'https://raw.githubusercontent.com/spywhere/plug.nvim/main/plug.lua'

if vim.fn.filereadable(vim.fn.expand(plug_path)) == 0 then
  if vim.fn.executable('curl') == 0 then
    -- curl not installed, skip the config
    print('cannot install plug.nvim, curl is not installed')
    return
  end
  vim.cmd(
    'silent !curl -fLo ' .. plug_path .. ' --create-dirs ' .. plug_url
  )
end

-- your plugin setup can go here
local plug = require('plug')

plug.setup {
  extensions = {
    -- also perform automatic installation for vim-plug and missing plugins
    plug.extension.auto_install {}
  }
}

'preservim/nerdtree' 'Xuyuanp/nerdtree-git-plugin'
'xiyaowong/nvim-cursorword'
'nvim-lua/plenary.nvim'
{
  'nvim-telescope/telescope.nvim',
  options = { ['tag'] = '0.1.x' }
}
{
    'nvim-treesitter/nvim-treesitter',
    options = { ['do'] = ':TSUpdate' }
}
'nvim-treesitter/playground'
'ThePrimeagen/harpoon'
'mbbill/undotree'
'tpope/vim-fugitive'

'wellle/context.vim'
'rose-pine/neovim'

-- LSP Support
'neovim/nvim-lspconfig'
'williamboman/mason.nvim'
'williamboman/mason-lspconfig.nvim'

-- Autocompletion
'hrsh7th/nvim-cmp'
'hrsh7th/cmp-buffer'
'hrsh7th/cmp-path'
'saadparwaiz1/cmp_luasnip'
'hrsh7th/cmp-nvim-lsp'
'hrsh7th/cmp-nvim-lua'

-- Snippets
'L3MON4D3/LuaSnip'
-- Snippet collection (Optional)
'rafamadriz/friendly-snippets'

'VonHeikemen/lsp-zero.nvim'

''
