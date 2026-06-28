-- lsp.lua (new API)

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"bashls",
		"ts_ls",
		"pyright",
		"html",
		"cssls",
		"jsonls",
		"clangd",
		"jdtls",
	},
})

-- keymaps khi attach
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	end,
})

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- config từng server
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
})

vim.lsp.config("bashls", {
	capabilities = capabilities,
})

vim.lsp.config("pyright", {
	capabilities = capabilities,
})

vim.lsp.config("html", {
	capabilities = capabilities,
})

vim.lsp.config("cssls", {
	capabilities = capabilities,
})

vim.lsp.config("jsonls", {
	capabilities = capabilities,
})

vim.lsp.config("clangd", {
	capabilities = capabilities,

	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
	},
})

-- Zig
vim.lsp.config("zls", {
	capabilities = capabilities,
	cmd = { "zls" },
	filetypes = { "zig" },
	root_markers = {
		"build.zig",
		".git",
	},
	settings = {
		zls = {
			enable_build_on_save = true,
			-- zig_exe_path = "/snap/bin/zig",
		},
	},
})
vim.lsp.enable("zls")

-- Rust
vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,

	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			check = {
				command = "clippy",
			},
			-- checkOnSave = {
			-- 	command = "clippy",
			-- },
			procMacro = {
				enable = true,
			},
			diagnostics = {
				enable = true,
			},
			inlayHints = {
				bindingModeHints = {
					enable = true,
				},
				closureReturnTypeHints = {
					enable = "always",
				},
				lifetimeElisionHints = {
					enable = "always",
				},
			},
		},
	},
})
vim.lsp.enable("rust_analyzer")

-- java
-- local home = os.getenv("HOME")
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:t")
-- local workspace_dir = home .. "/.local/share/eclipse/" .. project_name
--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "java",
-- 	callback = function()
-- 		require("jdtls").start_or_attach({
-- 			capabilities = capabilities,
-- 			cmd = { "jdtls", "-data", workspace_dir },
-- 			root_dir = require("jdtls.setup").find_root({ ".git", "pom.xml", "build.gradle", "gradlew" }),
-- 		})
-- 	end,
-- })

-- enable tất cả
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"pyright",
	"html",
	"cssls",
	"jsonls",
	"clangd",
})

-- diagnostics UI
vim.diagnostic.config({
	virtual_text = true,
	underline = true,
})
