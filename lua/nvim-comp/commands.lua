
local user_cmd = vim.api.nvim_create_user_command

local M = {}

M.loadCmds{
  user_cmd("NvimCompPog", "<cmd> echo pog<cr>", {})
}

return M
