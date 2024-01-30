local Plugin = {'lewis6991/gitsigns.nvim'}

function Plugin.config()
  require('gitsigns').setup({
    signs = {
      add = {text = '▎'},
      change = {text = '▎'},
      delete = {text = '➤'},
      topdelete = {text = '➤'},
      changedelete = {text = '▎'},
    }
})
end

return Plugin
