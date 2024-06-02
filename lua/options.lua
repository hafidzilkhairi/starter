require "nvchad.options"

-- add yours here!

local o = vim.o
o.nu = true
o.cursorlineopt ='both' -- to enable cursorline!
o.relativenumber = true
o.wrap = false
o.scrolloff = 15
o.termguicolors = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.swapfile = false
o.backup = false
o.colorcolumn = "80"
