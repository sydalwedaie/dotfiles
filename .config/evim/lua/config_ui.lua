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
				mode = 1,
				hide_filename_extension = false, -- Set true to hide extension
				show_modified_status = false,
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
