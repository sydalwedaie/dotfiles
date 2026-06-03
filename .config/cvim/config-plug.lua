-- Treesitter settings
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

-- Nvim Highlight Colors Settings
require("nvim-highlight-colors").setup({
	enable_tailwind = true,
})

-- Mini.files settings
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

-- LSP

vim.diagnostic.config({ virtual_text = true })
require("mason").setup()
require("mason-lspconfig").setup()

local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "buffer" },
		{ name = "path" },
	},
	formatting = {
		-- Show color highlight in auto complete menues
		format = require("nvim-highlight-colors").format,
	},
})

-- Get html auto-comp in template literals
vim.lsp.config("emmet_language_server", {
	capabilities = capabilities,
	filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
})

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "require" }, -- Recognize 'vim' as a global variable
			},
		},
	},
})

-- Telescope
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

-- Rainbow Delimiters
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

-- Lualine
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

-- Autopair
require("nvim-autopairs").setup({})

-- Theme Ember
require("ember").setup({
	variant = "ember-soft",
})

-- Formatting
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

-- ApiDocs
require("apidocs").setup()
