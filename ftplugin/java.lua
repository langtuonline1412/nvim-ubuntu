local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

local config = {
	capabilities = capabilities,
	cmd = { "jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

	-- Đây là nơi kích hoạt các tính năng mở rộng (như Debug)
	init_options = {
		bundles = {},
	},
}

-- Tìm đường dẫn của java-debug-adapter được cài bởi Mason
local mason_registry = require("mason-registry")
if mason_registry.has_package("java-debug-adapter") then
	local bundle = mason_registry.get_package("java-debug-adapter"):get_install_path()
	-- Tìm file .jar của debug adapter
	local expr = bundle .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"
	local jars = vim.fn.glob(expr, true, true)
	if #jars > 0 then
		table.insert(config.init_options.bundles, jars[1])
	end
end

-- Tùy chọn: Thêm cả java-test nếu bạn có cài đặt
if mason_registry.has_package("java-test") then
	local test_bundle = mason_registry.get_package("java-test"):get_install_path()
	local test_jars = vim.fn.glob(test_bundle .. "/extension/server/*.jar", true, true)
	for _, jar in ipairs(test_jars) do
		table.insert(config.init_options.bundles, jar)
	end
end

-- Khởi chạy jdtls với cấu hình trên
config["on_attach"] = function(client, bufnr)
	-- Đăng ký các chức năng debug của jdtls sau khi LSP kết nối thành công
	require("jdtls").setup_dap({ hotcodereplace = "auto" })

	-- Bạn có thể bổ sung các phím tắt dành riêng cho Java tại đây
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "<leader>df", function()
		require("jdtls").test_class()
	end, opts)
	vim.keymap.set("n", "<leader>dn", function()
		require("jdtls").test_nearest_method()
	end, opts)
end

require("jdtls").start_or_attach(config)
