-- Linter
local lint = require("lint")

lint.linters_by_ft = {
	python = { "flake8" },
	javascript = { "eslint_d" },
	lua = { "luacheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
