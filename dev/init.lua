package.loaded['nvim-comp'] = nil
package.loaded['dev'] = nil

vim.api.nvim_set_keymap('n', ',r', ':luafile dev/init.lua<cr>', {})

Comp = require('nvim-comp')
vim.api.nvim_set_keymap('n', '<A-8>', '<cmd>lua Comp.compile()<cr>', {})

