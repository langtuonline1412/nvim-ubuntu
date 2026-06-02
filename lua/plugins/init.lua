return {
	-- Lazy quản lý chính nó
	{ "folke/lazy.nvim" },

	-- Giao diện
	{ "nvim-lualine/lualine.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "xiyaowong/transparent.nvim" },

	-- Chủ đề colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- LSP
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },

	-- java
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
	},

	-- Formatter - conform.nvim
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python = { "black" },
					lua = { "stylua" },
					javascript = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},

	-- Linter - nvim-lint
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lint").linters_by_ft = {
				python = { "flake8" },
				javascript = { "eslint_d" },
				lua = { "luacheck" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	-- Toggle Terminal
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- Git integration
	{ "lewis6991/gitsigns.nvim" },

	-- fcitx5
	{
		"pysan3/fcitx5.nvim",
		config = function()
			local en = "keyboard-us"

			require("fcitx5").setup({
				imname = {
					norm = en,
					cmd = en,
				},
				remember_prior = true,
			})
		end,
	},
	-- Noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
}
