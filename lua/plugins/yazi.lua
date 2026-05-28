return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			"folke/snacks.nvim",
		},
		keys = {
			-- Phím tắt để mở Yazi tại thư mục của file đang mở hiện tại
			{
				"<leader>yy",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			-- Phím tắt để mở Yazi tại thư mục làm việc (cwd) của Neovim
			{
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open yazi at the current working directory",
			},
			-- Phím tắt để khôi phục lại trạng thái Yazi trước đó
			{
				"<leader>yr",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		opts = {
			open_for_directories = true,
			yazi_command_path = "/snap/bin/yazi",
		},
	},
}
