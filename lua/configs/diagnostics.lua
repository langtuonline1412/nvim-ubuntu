-- Các biểu tượng phổ biến sử dụng Nerd Fonts
local signs = {
	[vim.diagnostic.severity.ERROR] = " ", -- 1: Error Hoặc '', 'E', 'x'
	[vim.diagnostic.severity.WARN] = "", -- 2: Warning Hoặc '', 'W', '!'
	[vim.diagnostic.severity.INFO] = "", -- 3: Info Hoặc '', 'H', '?'
	[vim.diagnostic.severity.HINT] = "", -- 4: Hint Hoặc '', 'i'
}

-- Hàm diagnostic: trả về icon và dòng thông báo
local function format_diagnostic(diagnostic)
	-- Lấy icon trực tiếp bằng chỉ mục số
	local severity_icon = signs[diagnostic.severity] or " "
	-- Trả về icon + nội dung lỗi
	return string.format("%s %s", severity_icon, diagnostic.message)
end

-- Cấu hình hiển thị Diagnostics chính:
vim.diagnostic.config({
	-- 1. Cấu hình Hiển thị Ngắn gọn (Virtual Text)
	virtual_text = {
		enable = true,
		format = format_diagnostic,
		prefix = " ",
		spacing = 2,
		placement = "end", -- Hiển thị sau dòng code
	},

	-- 2. Cấu hình Biểu tượng ở Lề (Sign Column)
	signs = {
		enable = true,
		-- Thiết lập ánh xạ màu sắc cho từng loại lỗi
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},

	-- Các cài đặt chung khác...
	underline = true,
	severity_sort = true, -- Sắp xếp lỗi theo mức độ nghiêm trọng
	update_in_insert = false, -- không cập nhật diagnostic trong khi dđang nhập ở chế độ insert
	float = { -- Cấu hình hộp thoại hiển thị chi tiết khi di chuột
		border = "rounded",
		source = "always",
		header = "",
	},
})
