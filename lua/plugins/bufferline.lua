-- BufferLine
return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- hoặc "tabs"
				numbers = "none",
				diagnostics = "nvim_lsp",
				separator_style = "slant", -- | "padded_slant" | "thin"
				show_buffer_close_icons = true,
				show_close_icon = false,
				always_show_bufferline = true,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "center",
					},
				},

				-- Bỏ qua terminal và các buffer đặc biệt
				custom_filter = function(buf_number, buf_numbers)
					local buftype = vim.bo[buf_number].buftype
					local filetype = vim.bo[buf_number].filetype

					if buftype == "terminal" then
						return false
					end
					if filetype == "neo-tree" or filetype == "NvimTree" then
						return false
					end
					return true
				end,
			},
		})
	end,
}
