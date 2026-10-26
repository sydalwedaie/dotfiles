---------------------------------------
-- LUALINE
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
			{
				"diff",
				padding = { left = 0, right = 1 },
			},
		},
		lualine_c = {
			{
				"filetype",
				icon_only = true,
				padding = { left = 1, right = 0 },
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
				mode = 0,
				show_modified_status = false,
			},
		},

		lualine_z = {
			{
				"filename",
				mode = 1,
				file_status = false,
			},
		},
	},
})

---------------------------------------
-- NAVIC (BREADCRUMBS)
---------------------------------------
require("nvim-navic").setup({
	highlight = true,
	depth_limit = 3,
	lsp = {
		auto_attach = true,
		preference = nil,
	},
	format_text = function(text)
		-- Strip parameters from functions and methods, keeping only the name
		return text:gsub("%b().*", "")
	end,
})

---------------------------------------
-- Blink.indent
---------------------------------------
-- The line character is copied from snacks.nvim
require("blink.indent").setup({
	static = {
		char = "│",
	},

	scope = {
		char = "│",
		highlights = { "BlinkIndentBlue" },
	},
})
