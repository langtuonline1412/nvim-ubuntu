return {
	-- Required dependency
	{ "nvim-neotest/nvim-nio" },

	-- DAP core
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

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
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
