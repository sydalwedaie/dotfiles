---------------------------------------
-- TELESCOPE
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
-- MINI.FILES
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
