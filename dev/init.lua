package.loaded['nvim-comp'] = nil
package.loaded['dev'] = nil

vim.api.nvim_set_keymap('n', ',r', ':luafile dev/init.lua<cr>', {})

Comp = require('nvim-comp')
vim.api.nvim_set_keymap('n', '<A-0>', '<cmd>lua Comp.compile(true)<cr>', {})
vim.api.nvim_set_keymap('n', '<A-9>', '<cmd>lua Comp.compile(false)<cr>', {})




