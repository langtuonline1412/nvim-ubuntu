-- Cài đặt cơ bản
vim.opt.spell = true -- Kiểm tra chính tả (tiếng anh)
vim.opt.encoding = "utf-8" -- set encoding
vim.opt.fileencoding = "utf-8"
vim.opt.number = true -- Hiện số dòng
vim.opt.relativenumber = true -- Số dòng tương đối
vim.opt.tabstop = 4 -- tab = 4 spaces
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- Dùng space thay tab
vim.opt.cursorline = true -- Tô sáng dòng hiện tại
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus" -- Chia sẽ clipboard với hệ điều hành
vim.opt.autoindent = true -- Tự động thụt lề khi bắt đầu dòng mới
vim.opt.smartindent = true -- Tự động căn chỉnh lề một cách thông minh
vim.opt.termguicolors = true -- Bật màu chuẩn GUI
vim.opt.wrap = false -- Tắt tự động ngắt dòng
vim.opt.ignorecase = true -- Tìm kiếm không phân biệt HOA thường
vim.opt.smartcase = true -- Tìm kiếm phân biệt hoa thường nếu chuỗi cần tìm có ký tự hoa (ví dụ HOA, Hoa)
vim.opt.swapfile = false -- Không tạo swap file
vim.opt.backup = false -- Không tạo file backup
