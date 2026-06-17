---------------------------------------
-- CONFORM (FORMATTING)
---------------------------------------
require("conform").setup({
	formatters_by_ft = {
		-- install formatters via Mason, then assign them here
		lua = { "stylua" },
		css = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		bash = { "beautysh" },
		zsh = { "beautysh" },

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
-- AUTOPAIRS/AUTOTAG
---------------------------------------
require("nvim-autopairs").setup({})
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = false, -- disable auto close
	},
})
