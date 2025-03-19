local jdtls = require("jdtls")

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = "@cachedir@/jdtls/" .. vim.fn.getcwd()
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local jdtls_config = {
	cmd = { "@jdtls@/bin/jdtls", "-data", workspace_dir, "-configuration=@eclipsedir@" },
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
	settings = {
		java = {
			configuration = {
				-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
				-- And search for `interface RuntimeOption`
				-- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
				runtimes = {
					{
						name = "JavaSE-23",
						path = "@jdk23@/lib/openjdk",
					},
				},
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			eclipse = {
				downloadSources = true,
			},
			maven = {
				downloadSources = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			signatureHelp = { enabled = true },
			format = {
				settings = {
					url = "@javacfg@",
					profile = "MyFormat",
				},
			},
		},
	},

	init_options = {
		extendedClientCapabilities = extendedClientCapabilities,
		bundles = {
			vim.fn.glob(
				"@javadebug@/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-*.jar"
			),
			vim.fn.glob("@javatest@/share/vscode/extensions/vscjava.vscode-java-test/server/*.jar"),
		},
	},

	on_attach = function(client, bufnr)
		require("jdtls.setup").add_commands()
		jdtls.setup_dap({ hotcodereplace = "auto" })
		require("jdtls.dap").setup_dap_main_class_configs()
	end,
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(jdtls_config)
