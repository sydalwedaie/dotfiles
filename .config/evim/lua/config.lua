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

vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	virtual_text = true,
	virtual_lines = false,

	-- Auto open the float, jump with with `[d` and `]d`
	jump = {
		on_jump = function(_, bufnr)
			vim.diagnostic.open_float({
				bufnr = bufnr,
				scope = "cursor",
				focus = false,
			})
		end,
	},
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "cssls", "html", "ts_ls", "emmet_language_server", "lua_ls", "stylua" },
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
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	snippets = { preset = "luasnip" },
	signature = { enabled = true },
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})

-- Advertise blink's extended capabilities to ALL language servers
-- Fixed renaming modules not showing up where used in other modules
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Get Emmet working in template literals
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

-- Snippets
-- Make LuaSnip load VS Code style snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

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
-- Autopairs/Autotag
---------------------------------------
require("nvim-autopairs").setup({})
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = false, -- disable auto close
	},
})

---------------------------------------
-- Conform (Formatting)
---------------------------------------
require("conform").setup({
	formatters_by_ft = {
		-- install stylelua seperately (Mason)
		lua = { "stylua" },
		css = { "prettierd" },
		html = { "prettierd" },
		javascript = { "prettierd" },

		-- need the following two lines for webmanifest to work
		json = { "prettierd" },
		webmanifest = { "prettierd" },
	},

	format_on_save = {
		timeout_ms = 400,
		lsp_format = "fallback",
	},
})

---------------------------------------
-- Themes
---------------------------------------
-- Everforest

vim.g.everforest_enable_italic = 1
vim.g.everforest_inlay_hints_background = "dimmed"
vim.g.everforest_better_performance = 1
vim.g.everforest_background = "hard"
vim.g.everforest_transparent_background = 0

vim.opt.background = "dark"
vim.cmd.colorscheme("everforest")

-- Ember
require("ember").setup({
	variant = "ember-soft",
})

vim.cmd("hi! @punctuation.bracket gui=bold cterm=bold")
