-- Formatter

local conform = require("conform")

conform.setup({
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

vim.keymap.set("n", "<leader>lf", function()
	conform.format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })
