local Terminal = require("toggleterm.terminal").Terminal

-- Hàm tự động phát hiện và chạy code
function RunCode()
	local filetype = vim.bo.filetype
	local file = vim.fn.expand("%:t") -- lấy tên file (không có đường dẫn)
	local filename = vim.fn.expand("%:t:r") -- lấy tên file (không có đuôi extension)
	local fullpath = vim.fn.expand("%:p") -- lấy tên file đầy đủ (bao gồm cả đường dẫn)
	local path = vim.fn.expand("%:p:h") -- lấy đường dẫn thư mục

	local cmd = ""

	if filetype == "python" then
		-- Python trong ubuntu wsl chưa hỗ trợ đồ họa như tkinter, turtle
		cmd = "python3 " .. file
	elseif filetype == "cpp" then
		-- C++ (compile và run trong terminal)
		cmd = "g++ -g " .. file .. " -o " .. filename .. " && ./" .. filename
	elseif filetype == "c" then
		-- C (compile and run)
		cmd = "gcc -g " .. file .. " -o " .. filename .. " && ./" .. filename
	elseif filetype == "rust" then
		-- Rust (Compile and run) biên dịch và chạy file rust đơn lẻ
		-- cmd = "rustc " .. file .. " && ./" .. filename
		-- Run project (Cargo) Chạy dự án tạo bằng cargo
		cmd = "cargo run"
	elseif filetype == "zig" then
		-- Zig
		cmd = "zig build run"
	elseif filetype == "go" then
		-- Go
		cmd = "go run ."
	elseif filetype == "java" then
		-- Java (compile và run trong terminal)
		cmd = "javac " .. file .. " && java " .. filename
	elseif filetype == "javascript" then
		-- JavaScript (Node.js)
		cmd = "node " .. file
	elseif filetype == "html" then
		-- HTML (live-server, phải cài sẵn npm i -g live-server)
		local choice =
			vim.fn.input("Chạy file HTML bằng [1] live-server, [2] Brave Browser, [3] Chạy live-server: ")
		if choice == "1" then
			cmd = "live-server " .. file
		elseif choice == "2" then
			cmd = "brave-browser file://" .. fullpath
		elseif choice == "3" then
			cmd = "live-server"
		else
			print("❌ Lựa chọn không hợp lệ.")
			return
		end
	else
		print("⚠️ Ngôn ngữ chưa được hỗ trợ: " .. filetype)
		return
	end

	-- Tạo terminal và chạy lệnh
	local term = Terminal:new({
		cmd = cmd,
		direction = "float", -- horizontal, vertical, float, tab
		close_on_exit = false,
		hidden = true,
	})

	term:toggle()
end

-- Keymap
vim.keymap.set("n", "<leader>r", RunCode, { noremap = true, silent = true, desc = "Run code" })
