return {
	-- Required dependency
	{ "nvim-neotest/nvim-nio" },

	-- DAP core
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			-- Cấu hình hiển thị icon Breakpoint cho đẹp và dễ nhìn (thay vì chữ B thô sơ)
			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpointLine", numhl = "DapBreakpointNum" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "⚪", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "▶️", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStoppedNum" }
			)

			-- Python
			dap.adapters.python = {
				type = "executable",
				command = "python3",
				args = { "-m", "debugpy.adapter" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						return "python3"
					end,
				},
			}

			-- C/C++
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					-- command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
					command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",

					args = { "--port", "${port}" },
				},
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",

					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,

					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					runInTerminal = true,
				},
			}
			dap.configurations.c = dap.configurations.cpp
		end,
	},

	-- UI hiển thị trạng thái debug
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			-- Tự động mở/đóng giao diện UI khi debug
			dap.listeners.before.attach["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.launch["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.after.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.after.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
