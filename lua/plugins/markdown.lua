return {
	-- Comment Code
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		keys = {
			{ "gc", mode = { "n", "v" }, desc = "toggle comment" },
			{ "gb", mode = { "n", "v" }, desc = "toggle block comment" },
		},
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_auto_start = 0
		end,
	},

	{
		"preservim/vim-markdown",
		ft = { "markdown" },
		init = function()
			vim.g.vim_markdown_folding_disabled = 1
		end,
	},

	-- Hiển thị Markdown trong Neovim
	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- tên rút gọn để gọi lại
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "markdown",
		config = function()
			require("render-markdown").setup({})
		end,
	},

	-- Treesitter cho Markdown
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
			opts.highlight = opts.highlight or {}
			opts.highlight.additional_vim_regex_highlighting = { "markdown" }
		end,
	},
}
