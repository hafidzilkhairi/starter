require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", {desc = "telescope find definitions"})
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", {desc = "telescope find references"})
map("n", "<leader>fi", "<cmd>Telescope lsp_implementations<CR>", {desc = "telescope find implementations"})

map("n", "<leader>o", "o<ESC>", {desc = "newline without insert mode"})
map("n", "<leader>O", "O<ESC>", {desc = "newline without insert mode"})

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")


map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

map({ "n", "t" }, "<leader>h", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

map("t", "<leader>x", "<C-\\><C-N>", { desc = "Terminal escape"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
