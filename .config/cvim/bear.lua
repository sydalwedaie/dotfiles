local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function search_bear_notes(opts)
	opts = opts or {}

	-- 1. Fetch notes from bearcli as JSON
	-- We request id, title, and tags to display in Telescope
	local cmd = { "bearcli", "list", "--format", "json", "--fields", "id,title,tags" }
	local json_output = vim.fn.system(cmd)

	-- Handle CLI errors (exit code 1 or 64)
	if vim.v.shell_error ~= 0 then
		vim.notify("Error running bearcli: " .. json_output, vim.log.levels.ERROR)
		return
	end

	-- 2. Decode the JSON output: `[{...},{...}]`
	local notes = vim.fn.json_decode(json_output)
	if not notes or #notes == 0 then
		vim.notify("No Bear notes found.", vim.log.levels.INFO)
		return
	end

	-- 3. Create the Telescope Picker
	pickers
		.new(opts, {
			prompt_title = "Bear Notes",
			finder = finders.new_table({
				results = notes,
				entry_maker = function(entry)
					-- Format the tags into a clean string for the display
					local tags_str = ""
					if entry.tags and #entry.tags > 0 then
						tags_str = " [" .. table.concat(entry.tags, ", ") .. "]"
					end

					local display_str = (entry.title or "Untitled") .. tags_str

					return {
						value = entry,
						display = display_str,
						ordinal = display_str, -- ordinal is what Telescope fuzzy-matches against
						id = entry.id,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local note_id = selection.id

					-- ACTION: Read note content and open in a new Neovim buffer
					-- We use 'cat' for raw content without JSON escaping
					local content = vim.fn.system({ "bearcli", "cat", note_id })

					if vim.v.shell_error ~= 0 then
						vim.notify("Failed to open note.", vim.log.levels.ERROR)
						return
					end

					-- Create a new buffer and populate it
					vim.cmd("enew")
					local lines = vim.split(content, "\n")
					vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

					-- Set basic buffer options
					vim.bo.filetype = "markdown"
					vim.bo.buftype = "nofile" -- Prevents standard :w saving (requires API to overwrite)
					vim.bo.bufhidden = "hide"
					vim.api.nvim_buf_set_name(0, "bear://" .. note_id)

					-- ALTERNATIVE ACTION:
					-- If you prefer to open the note directly in the Bear UI instead of Neovim,
					-- comment out the buffer code above and uncomment this line:
					-- vim.fn.system({"bearcli", "open", note_id})
				end)
				return true
			end,
		})
		:find()
end

-- Create a user command to launch it
vim.api.nvim_create_user_command("BearSearch", search_bear_notes, {})

vim.keymap.set("n", "<leader>sb", ":BearSearch<CR>", { desc = "[F]ind [B]ear Notes" })
