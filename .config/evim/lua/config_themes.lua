---------------------------------------
-- THEMES
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

---------------------------------------
-- STYLES
---------------------------------------
-- Bold brackets
vim.cmd("hi! @punctuation.bracket gui=bold cterm=bold")

-- Highlight colors
require("nvim-highlight-colors").setup({
	enable_tailwind = true,
})
