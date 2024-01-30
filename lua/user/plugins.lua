local env = require('user.env')
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
    print('Done.')
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {
  ui = {
    icons = env.lazy_icons,
    border = 'rounded',
  },
  install = {
    missing = true,            -- install missing plugins on startup.
    colorscheme = {'nightly'}  -- use this theme during first install process
  },
  change_detection = {
    enabled = true, -- check for config file changes
    notify = true,  -- get a notification when changes are found
  },
}

lazy.setup({
  -- Load them from the lua/plugins folder
  {import = 'plugins'},
  {'folke/tokyonight.nvim'},
  -- Lualine can give us a good looking statusline
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'numToStr/Comment.nvim',
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

})

-- ========================================================================== --
-- ==                            LOCAL PLUGINS                             == --
-- ========================================================================== --

require('local.tmux')
require('local.session')

require('local.tabline').setup()
require('local.buffer-nav').setup()
require('local.statusline').setup()
require('lualine').setup({
  options = {
    theme = 'tokyonight',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = {
      statusline = {'NvimTree'}
  }
  },
  })
require("tokyonight").setup({
  style = "night",
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end

})
require('Comment').setup()
require('ibl').setup({
  indent = {
    char = '▏',
  },
})
