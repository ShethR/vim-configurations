local fns = require('user.functions')

-- Bind options
local bind = vim.keymap.set
local remap = {remap = true}

-- Leader
vim.g.mapleader = ' '

-- ========================================================================== --
-- ==                             KEY MAPPINGS                             == --
-- ========================================================================== --

-- keybindings

-- Copy/Paste/Delete
bind({'n', 'x'}, 'gy', '"+y') -- Copy to clipboard.
bind({'n', 'x'}, 'gp', '"+p') -- Paste from clipboard.
bind({'n', 'x'}, 'x', '"_x') -- Delete without changing the registers
bind({'n', 'x'}, 'X', '"_d') -- Delete without changing the registers

-- Redo
bind('n', 'U', '<C-r>')

-- Select all text in current buffer
bind('n', '<leader>a', '<cmd>keepjumps normal! ggVG<cr>')

-- Navigate between vim split panes
vim.api.nvim_set_keymap('n', '<c-k>', '<cmd>wincmd k<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<c-j>', '<cmd>wincmd j<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<c-h>', '<cmd>wincmd h<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<c-l>', '<cmd>wincmd l<CR>', {silent = true})

