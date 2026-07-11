---------------------------------------
-- DAP CONFIGS
---------------------------------------
local dap = require("dap")

require("mason-nvim-dap").setup({
	ensure_installed = { "js" },
	handlers = {}, -- empty = enable all default handlers; do NOT omit this
})

-- Each entry below is one option in the picker that appears
-- when you press start the debugger.
-- sourceMaps = true is essential for TypeScript and React
-- (compiled output would be stepped through otherwise).

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "js-debug-adapter",
		-- 💀 Make sure to update this path to point to your installation
		args = { "${port}" },
	},
}

local js_configs = {

	-- Node: launch the current file
	-- For TypeScript: compile first, or set runtimeExecutable = "ts-node"
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file (Node)",
		program = "${file}",
		cwd = "${workspaceFolder}",
		sourceMaps = true,
		outFiles = { "${workspaceFolder}/**/*.js", "!**/node_modules/**" },
	},

	-- Node: attach to a process already running with --inspect
	-- Start your app:  node --inspect index.js  (or --inspect-brk to pause immediately)
	{
		type = "pwa-node",
		request = "attach",
		name = "Attach to Node process",
		processId = require("dap.utils").pick_process,
		cwd = "${workspaceFolder}",
		sourceMaps = true,
	},

	-- Chrome: launch a new Chrome window pointed at your React dev server
	-- Dev server must already be running. Port: 3000 for CRA, 5173 for Vite.
	{
		type = "pwa-chrome",
		request = "launch",
		name = "Launch Chrome (React dev server)",
		url = "http://localhost:3000",
		webRoot = "${workspaceFolder}/src",
		sourceMaps = true,
	},

	-- Chrome: attach to a Chrome you started manually with the debug port open
	-- Launch Chrome first:  google-chrome --remote-debugging-port=9222 --user-data-dir=/tmp/chrome-debug
	{
		type = "pwa-chrome",
		request = "attach",
		name = "Attach to Chrome (port 9222)",
		port = 9222,
		webRoot = "${workspaceFolder}/src",
		sourceMaps = true,
	},
}

for _, ft in ipairs({
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
}) do
	dap.configurations[ft] = js_configs
end

---------------------------------------
-- DAP UI CONFIGS
---------------------------------------
local dapui = require("dapui")
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- ─── 6. KEYMAPS ───────────────────────────────────────────────────────────────

local map = function(key, fn, desc)
	vim.keymap.set("n", key, fn, { desc = desc, silent = true })
end

map("<F5>", dap.continue, "Debug: Continue / Start")
map("<F10>", dap.step_over, "Debug: Step Over")
map("<F11>", dap.step_into, "Debug: Step Into")
map("<F12>", dap.step_out, "Debug: Step Out")
map("<leader>b", dap.toggle_breakpoint, "Debug: Toggle Breakpoint")
map("<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Condition: "))
end, "Debug: Conditional Breakpoint")

map("<leader>dl", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log message: "))
end, "Debug: Log Point")

map("<leader>du", dapui.toggle, "Debug: Toggle UI")
map("<leader>dr", dap.repl.open, "Debug: Open REPL")
map("<leader>dx", dap.terminate, "Debug: Terminate session")
