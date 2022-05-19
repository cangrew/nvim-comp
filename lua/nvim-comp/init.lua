
local Comp = require "nvim-comp.nvim-comp"

local M = {}
local Buff_table = {}

local function create_buff()
  local b = {}
  Comp.init(b)
  return b
end

local function delete_buff(b_id)
  Buff_table[b_id] = nil
end

function M.compile(use_term)
  local b_id = vim.api.nvim_get_current_buf()

  if Buff_table[b_id] == nil then
    Buff_table[b_id] = create_buff()
  end

  if use_term == 1 then
    Comp.compile_term(Buff_table[b_id])
  elseif use_term == 0 then
    Comp.compile(Buff_table[b_id])
  end
end



return M
