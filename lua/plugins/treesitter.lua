-- Highlight code
-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	buid = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "lua", "vim", "python", "javascript", "html", "css", "c", "cpp", "java" },
			highlight = { enable = true },
			autotag = { enable = true },
		})
	end,
}
