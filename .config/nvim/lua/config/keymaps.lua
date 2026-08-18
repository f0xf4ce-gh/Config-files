local map = vim.keymap.set
local opts = { silent = true }

map({ "n", "i", "v" }, "<C-s>", "<cmd>write<cr>", opts)
map("n", "<C-z>", "u", opts)
map("n", "<C-y>", "<C-r>", opts)
map({ "n", "i", "v" }, "<C-a>", "<Esc>ggVG", opts)
map({ "n", "v" }, "<C-c>", '"+y', opts)
map({ "n", "v" }, "<C-x>", '"+d', opts)
map({ "n", "i", "v" }, "<C-v>", '"+p', opts)
map("n", "<C-Tab>", "<cmd>bnext<cr>", opts)
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", opts)
map("n", "<C-w>", "<cmd>bdelete<cr>", opts)
map("n", "<C-p>", "<cmd>lua Snacks.picker.files()<cr>", opts)
