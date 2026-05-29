-- Keymap cơ bản
-- Dễ viết hơn (không phải gõ nhiều `vim.keymap.set`)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Lưu file
map("n", "<C-s>", ":w<CR>", { desc = "Save file" }, opts)
map("n", "<leader>w", ":w<CR>", { desc = "Save file" }, opts)
map("i", "<C-s>", "<Esc>:w<CR>l", { desc = "Save file in insert mode" })

-- Thoát file
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>Q", ":qa<Return>", opts)

-- NvimTree toggle
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>f", ":NvimTreeFindFile<Return>", opts)

-- Tìm kiếm (Fuzzy)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Bufferline
map("n", "<leader>n", ":bn<cr>") -- Chuyển sang file kế tiếp
map("n", "<leader>p", ":bp<cr>") -- Chuyển về file trước đó
map("n", "<leader>x", ":bd<cr>") -- Đóng file hiện tại

-- Chọn theme
map("n", "<leader>cs", "<cmd>Telescope colorscheme<CR>", { desc = "Choose Colorscheme" })

-- move a blocks of text up/down with K/J in visual mode
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Center the screen on the next/prev search result with n/N
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Center the screen after scrolling up/down width Ctrl-u/d
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- move 5 lines up/down with arrows keys
map("n", "<Down>", "5jzz")
map("n", "<Up>", "5kzz")

-- Paste in visual mode without yanking replace text
map("x", "p", [["_dP]])

-- yank to clipboard
map({ "n", "v" }, "<leader>y", [["+y]])

-- yank line to clipboard
map("n", "<leader>Y", [["+Y]])

-- delete without yanking
map({ "n", "v" }, "<leader>d", [["_d]])

-- Debug
map("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = "Start/Continue Debug" }) -- Bắt đầu debug hoặc tiếp tục
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { desc = "Step Over" }) -- Step Over
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { desc = "Step Into" }) -- Step Into
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { desc = "Step Out" }) -- Step Out
map("n", "<leader>dc", ":lua require'dap'.terminate()<CR>", { desc = "DAP Terminate" }) -- Dừng debug
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" }) -- Đặt Breakpoint
map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
