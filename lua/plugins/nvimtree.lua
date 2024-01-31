local Plugin =  {
    -- 'kyazdani42/nvim-tree.lua',
    "kyazdani42/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
    "kyazdani42/nvim-web-devicons",
  }
  }
  --
-- See :help nvim-tree-setup
function Plugin.config()
  require('nvim-tree').setup({
      disable_netrw = true,
      view = {
    width = 40,
    relativenumber = true,
  },
  actions = {
    open_file = {
      resize_window = true,
      window_picker = {
        enable = false,
      }
    }
  },
  hijack_cursor = false,

    -- Remap keys only within NvimTree
    on_attach = function(bufnr)
      local bufmap = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
      end
    --
      -- :help nvim-tree.api
      local api = require('nvim-tree.api')

      bufmap('V', api.node.open.vertical, 'Open File in Vsplit')
      bufmap('H', api.node.open.horizontal, 'Open File in Vsplit')
      bufmap('L', api.node.open.edit, 'Expand folder or go to file')
      -- bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
      -- bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
    end
  })
end

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
return Plugin
