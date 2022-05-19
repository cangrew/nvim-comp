
if exists("g:loaded_nvimcomp")
  finish
endif
let g:loaded_nvimcomp = 1

let s:lua_rocks_deps_loc = expand("<sfile>:h:r") . "/../lua/nvim-comp/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

command! -nargs=0 NvimCompTerm lua require("nvim-comp").compile(true)
