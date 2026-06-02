-- Linter
local lint = require("lint")

lint.linters_by_ft = {
	python = { "flake8" },
	javascript = { "eslint_d" },
	lua = { "luacheck" },
	cpp = { "clangtidy" },
	c = { "clangtidy" },
	java = { "checkstyle" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
})
