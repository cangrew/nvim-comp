
local type_tbl = {
  ["c"] = 'gcc',
  ["cpp"] = 'g++',
}

local function compile()
  local file = vim.fn.expand("%:p")
  local file_o = vim.fn.expand("%:p:r")
  local filepath = vim.fn.expand("%:p:h") .. '/'
  local file_exe = './' .. vim.fn.expand("%:t:r")
  local file_x = vim.fn.expand("%:e")

  vim.cmd("vsplit | terminal")

  local compiler = type_tbl[file_x]
  local comp = ':call jobsend(b:terminal_job_id, "' .. compiler .. ' ' .. file .. ' -o ' .. file_o .. '\\n")'
  local run = ':call jobsend(b:terminal_job_id, "' .. filepath .. file_exe .. '\\n")'
  
  vim.cmd(comp)
  vim.cmd(run)
end


return {
  compile = compile,
}
