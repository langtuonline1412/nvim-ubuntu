-- Chủ đề (Colorscheme)
return {
	"Mofiqul/dracula.nvim",
	priority = 1000,
	config = function()
		require("dracula").setup({
			colors = {
				bg = "#282A36",
				fg = "#F8F8F2",
			},
			show_end_of_buffer = true, -- hiển thị ~ ở dòng trống
			transparent_bg = true, -- nền trong suốt
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})

		-- vim.cmd.colorscheme("dracula")
	end,
}
