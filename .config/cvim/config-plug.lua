---------------------------------------
-- Treesitter
---------------------------------------
local parsers = {
	"bash",
	"c",
	"css",
	"csv",
	"diff",
	"go",
	"html",
	"javascript",
	"jsx",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"rust",
	"scss",
	"sql",
	"tmux",
	"toml",
	"typescript",
	"typst",
	"vim",
	"zsh",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = parsers,
	callback = function()
		vim.treesitter.start()
	end,
})

require("nvim-treesitter").install(parsers)

---------------------------------------
-- Highlight Colors
---------------------------------------
require("nvim-highlight-colors").setup({
	enable_tailwind = true,
})

---------------------------------------
-- Mini.files
---------------------------------------
require("mini.files").setup({
	mappings = {
		reveal_cwd = "@",
	},

	options = {
		permanent_delete = true,
		use_as_default_explorer = true,
	},

	windows = {
		preview = true,
	},
})

---------------------------------------
-- LSP
---------------------------------------

vim.diagnostic.config({ virtual_text = true })
require("mason").setup()
require("mason-lspconfig").setup()

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
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	signature = { enabled = true },

	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})

-- Advertise blink's extended capabilities to ALL language servers
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Get html auto-comp in template literals
vim.lsp.config("emmet_language_server", {
	filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "require" }, -- Recognize 'vim' as a global variable
			},
		},
	},
})

---------------------------------------
-- Telescope
---------------------------------------
require("telescope").setup({
	pickers = {
		find_files = {
			find_command = {
				"rg",
				"--files",
				"--hidden", -- Show dotfiles
				"--glob",
				"!**/.git/*", -- But exclude .git directory
			},
			-- rg respects .gitignore by default
		},
	},
})

---------------------------------------
-- Rainbow Delimiters
---------------------------------------
vim.g.rainbow_delimiters = {
	highlight = {
		"yellow",
		"RainbowDelimiterRed",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
}

-- Navic (breadcrumbs)
require("nvim-navic").setup({
	highlight = true,
	depth_limit = 3,
	lsp = {
		auto_attach = true,
		preference = nil,
	},
})

---------------------------------------
-- Lualine
---------------------------------------
require("lualine").setup({
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		always_show_tabline = false,
	},

	sections = {
		lualine_b = {
			"branch",
		},
		lualine_c = {
			{
				"filetype",
				icon_only = true,
			},
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = {
			{
				"navic",
				color_correction = "dynamic",
				navic_opts = nil,
			},
		},
	},

	tabline = {
		lualine_a = {
			{
				"tabs",
				hide_filename_extension = false, -- Set true to hide extension
				mode = 1,
				show_modified_status = false,
			},
		},
	},
})

---------------------------------------
-- Autopairs
---------------------------------------
require("nvim-autopairs").setup({})

---------------------------------------
-- Conform (Formatting)
---------------------------------------
require("conform").setup({
	formatters_by_ft = {

		-- install stylelua seperately (Mason)
		lua = { "stylua" },

		-- need the following two lines for webmanifest to work
		json = { "prettier" },
		webmanifest = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 500,
	},
})

---------------------------------------
-- Themes
---------------------------------------
-- Ember
require("ember").setup({
	variant = "ember-soft",
})
