
-- FileType specific settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

-- Remove Trailing White Spaces for certain file types
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.c", "*.cpp", "*.java", "*.php", "*.py"},
    callback = function()
        vim.cmd '%s/\\s\\+$//e'
    end,
})

-- ========================================================================== --
-- ==                            DEPENDENCIES                              == --
-- ========================================================================== --

-- ripgrep    - https://github.com/BurntSushi/ripgrep
-- fd         - https://github.com/sharkdp/fd
-- git        - https://git-scm.com/
-- make       - https://www.gnu.org/software/make/
-- c compiler - gcc or tcc or zig

-- Try to load "env" file
local ok, env = pcall(require, 'user.env')
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

if not ok then
  local msg = 'lua/user/env.lua not found. You should probably rename env.sample'
  vim.notify(msg, vim.log.levels.ERROR)
  return
end

require('user.settings')
require('user.commands')
require('user.keymaps')
require('user.plugins')

-- Apply theme
vim.cmd("colorscheme tokyonight-night")
