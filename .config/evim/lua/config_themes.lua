---------------------------------------
-- GENERAL
---------------------------------------
-- Bold Brackets
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("CustomHighlights", { clear = true }),
	callback = function()
		vim.api.nvim_set_hl(0, "@punctuation.bracket", { bold = true })
	end,
})

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
-- HIGHLIGHT COLORS
---------------------------------------
require("nvim-highlight-colors").setup({
	enable_tailwind = true,
	render = "virtual",
	virtual_symbol = "󱓻",
	-- this one has a small space "󱓻 "
})

-- Disable built-in automatic highlights
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.lsp.document_color.enable(false, { bufnr = ev.buf })
	end,
})
