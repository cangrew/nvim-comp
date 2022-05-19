
local M = {}

local type_tbl = {
  ["c"] = 'gcc',
  ["cpp"] = 'g++',
}

local function clear_invalid(Buffer)
  for _, v in pairs(vim.api.nvim_list_chans()) do
    if v['id'] == Buffer.term_id then
      return
    end
  end
  Buffer.term_id = nil
end

function M.init(Buffer)
  Buffer.filepath = vim.fn.expand("%:p")
  Buffer.file_o = vim.fn.expand("%:p:r")
  Buffer.file_x = vim.fn.expand("%:e")
  Buffer.comp = type_tbl[Buffer.file_x]
end


-- compiles current file pointed by Buffer
function M.compile(Buffer)

  local comp = ':! ' .. Buffer.comp .. ' ' .. Buffer.filepath .. ' -o ' .. Buffer.file_o

  vim.cmd(comp)
end

-- opens terminal and compiles file pointed by Buffer
function M.compile_term(Buffer)
  clear_invalid(Buffer)
  if Buffer.term_id == nil then
    vim.cmd("vsplit | terminal")
    Buffer.term_id = vim.b.terminal_job_id
    print(Buffer.term_id)
  end

  local cmd = Buffer.comp .. ' ' .. Buffer.filepath .. ' -o ' .. Buffer.file_o
  vim.api.nvim_chan_send(Buffer.term_id, cmd .. '\r')


  print(cmd)

end


-- compiles and runs
local function compile_run()
  local file = vim.fn.expand("%:p")
  local file_o = vim.fn.expand("%:p:r")
  local filepath = vim.fn.expand("%:p:h") .. '/'
  local file_exe = './' .. vim.fn.expand("%:t:r")
  local file_x = vim.fn.expand("%:e")

  --vim.cmd("vsplit | terminal")

  local compiler = type_tbl[file_x]
  local comp = ':call jobsend(b:terminal_job_id, "' .. compiler .. ' ' .. file .. ' -o ' .. file_o .. '\\n")'
  local run = ':call jobsend(b:terminal_job_id, "' .. filepath .. file_exe .. '\\n")'
  local test = ':! ' .. compiler .. ' ' .. file .. ' -o ' .. file_o

  --vim.cmd(comp)
  --vim.cmd(run)
  vim.cmd(test)
  
end


-- opens terminal and does compile_run
local function compile_run_term()
  
end

-- runs program if exists
local function run()
  
end

-- runs program on terminal if exits
local function run_term()
  
end


return M
