 
local chans = {}
local i = 0
for _k, v in pairs(vim.api.nvim_list_chans()) do
  chans[i] = v['id']
  i = i + 1
end

print(chans[0])
