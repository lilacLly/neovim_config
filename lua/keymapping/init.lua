local map = vim.api.nvim_set_keymap

-- BufferLine
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {})
map("n", "<Tab>", ":BufferLineCycleNext<CR>", {})

-- Telescope
map("n", "<Bslash>ff", ":Telescope find_files<CR>", {})
map("n", "<Bslash>fg", ":Telescope live_grep<CR>", {})

