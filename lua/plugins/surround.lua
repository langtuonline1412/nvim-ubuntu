return {
	"kylechui/nvim-surround",
	version = "*", -- hoặc commit hash nếu muốn cố định
	event = "VeryLazy", -- chỉ load khi cần
	config = function()
		require("nvim-surround").setup()
	end,
}
