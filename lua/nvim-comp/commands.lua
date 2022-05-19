
local nvim_cmd = vim.api.nvim_create_user_command
local comp = require "nvim-comp"

nvim_cmd("NvimCompTerm",'comp.compile(true)')

