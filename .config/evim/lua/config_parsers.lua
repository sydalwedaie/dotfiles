---------------------------------------
-- TREESITTER
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
