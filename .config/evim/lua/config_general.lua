---------------------------------------
-- DIAGNOSTICS
---------------------------------------
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "none", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	virtual_text = true,
	virtual_lines = false,

	-- Auto open the float, jump with with `[d` and `]d`
	jump = { float = true },
})
