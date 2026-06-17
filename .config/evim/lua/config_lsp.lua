---------------------------------------
-- LSP AND COMPLETION
---------------------------------------
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "cssls", "html", "ts_ls", "emmet_language_server", "lua_ls", "jsonls", "bashls" },
})

-- I needed this to install non-lsp stuff!
require("mason-tool-installer").setup({
	ensure_installed = { "prettierd", "prettier", "stylua", "beautysh" },
})

require("blink.cmp").setup({
	keymap = { preset = "default" },

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		menu = { border = "none" },
		documentation = {
			auto_show = true,
			window = { border = "none" },
		},
		list = {
			selection = {
				preselect = false,
			},
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	snippets = { preset = "luasnip" },
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})

-- Advertise blink's extended capabilities to ALL language servers
-- Add File watching capability (notify LSP of changes outside the editor)
-- Fixed renaming modules not showing up where used in other modules
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities({
		workspace = {
			didChangeWatchedFiles = { dynamicRegistration = true },
		},
	}),
})

vim.lsp.config("ts_ls", {
	init_options = {
		preferences = {
			importModuleSpecifierEnding = "js",
		},
	},
})

-- Get Emmet working in template literals
vim.lsp.config("emmet_language_server", {
	filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "require" },
			},
		},
	},
})

-- Snippets
-- Make LuaSnip load VS Code style snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
