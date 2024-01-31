local env = require('user.env')

if not env.tempdir then
  -- Don't use temp files
  vim.opt.swapfile = false
  vim.opt.backup = false
end

-- Ignore the case when the search pattern is all lowercase
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Disable line wrapping
vim.opt.wrap = false

-- Keep lines below cursor when scrolling
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5

-- Don't highlight search results
vim.opt.hlsearch = false

-- Enable cursorline
vim.opt.cursorline = true

-- Always display signcolumn (for diagnostic related stuff)
vim.opt.signcolumn = 'yes'

-- When opening a window put it right or below the current one
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tab set to four spaces
vim.opt.tabstop = 4 -- number of spaces in one tab
vim.opt.shiftwidth = 4 -- This option influences the keybindings << and >>
vim.opt.softtabstop = 4 -- number of spaces to delete when pressed backpack on a tab
vim.opt.expandtab = true -- transform tabs to spaces
vim.opt_local.shiftwidth = 4
vim.opt.breakindent = true -- preserve indentations of the long lines
vim.opt.autoindent = true

-- show line number
vim.opt.number = true
vim.opt.encoding = 'utf-8'

-- Enable mouse support
vim.opt.mouse = 'r'

-- Look for a tag file in the git folder
-- I shouldn't have to use `cwd` but here we are
vim.opt.tags:prepend(string.format('%s/.git/tags', vim.fn.getcwd()))

-- Insert mode completion setting
vim.opt.completeopt = {'menu', 'menuone'}

-- Use the pretty colors
vim.opt.termguicolors = true

-- Set grep default grep command with ripgrep
vim.opt.grepprg = 'rg --vimgrep --follow'
vim.opt.errorformat:append('%f:%l:%c%p%m')

-- show vim mode - normal, visual etc.
vim.opt.showmode = false
-- Activate Delete key
vim.opt.backspace = { "indent", "eol", "start" }

