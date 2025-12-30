-- Java Custom Config

local home = os.getenv("HOME")
local mason_path = home .. "/.local/share/nvim/mason"
local jdtls_path = mason_path .. "/packages/jdtls"

local lombok_path = home .. "/.local/share/java/lombok/lombok.jar"

local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

local system_os = "mac"

-- 4. CALCULATE WORKSPACE DATA
-- This creates a unique workspace for every project, preventing cache conflicts
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h"):match("([^/]+)$")
local workspace_dir = home .. "/.cache/jdtls-workspace/" .. project_name

local config = {
	cmd = {
		"/opt/homebrew/Cellar/openjdk@21/21.0.9/libexec/openjdk.jdk/Contents/Home/bin/java", -- absolute path to JDK 17+

		-- IMPORTANT: The Lombok Agent
		"-javaagent:" .. lombok_path,

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		launcher_jar,
		"-configuration",
		jdtls_path .. "/config_" .. system_os,
		"-data",
		workspace_dir,
	},

	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

	settings = {
		java = {
			configuration = {
				runtimes = {
					-- If you need to define multiple JDKs, do it here
					-- {
					--     name = "JavaSE-17",
					--     path = "/path/to/jdk17",
					-- },
				},
			},
		},
	},

	-- Setup capabilities for auto-completion (linking to blink.cmp)
	capabilities = require("blink.cmp").get_lsp_capabilities(),

	on_attach = function(client, bufnr)
		-- Re-use the keymaps you defined in your lsp.lua
		-- (Ideally, you should extract your keymap function to a shared module,
		--  but for now, you might need to copy-paste your map function here)
	end,
}

-- 5. START THE SERVER
require("jdtls").start_or_attach(config)
