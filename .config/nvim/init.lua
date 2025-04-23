vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd('filetype plugin on')
vim.cmd('syntax on')

vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true -- required for bufferline

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
map('n', '<C-s>', ':w<CR>',  default_opts)
map('i', '<C-s>', '<esc>:w<CR>', default_opts)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
-- To check the current status of plugins:
--   :Lazy
-- To update plugins:
--   :Lazy update
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'preservim/tagbar', -- Sidebar to browse the tags of the current file
  'lewis6991/spaceless.nvim', -- Strip trailing whitespace as you are editing
  'mg979/vim-visual-multi', -- Multiple cursors plugin
  {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
})

require("bufferline").setup{}
vim.g.tagbar_sort = false

vim.cmd.colorscheme "catppuccin"

