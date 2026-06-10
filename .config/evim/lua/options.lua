vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 -- tree view

-- UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false
opt.showcmd = true
opt.pumheight = 10
opt.scrolloff = 1
opt.splitbelow = true
opt.splitright = true

-- Line display
opt.wrap = true
opt.breakindent = true
opt.linebreak = true
opt.showbreak = "↪"

-- Timing
opt.timeout = true
opt.timeoutlen = 600 -- balance speed vs multi-key maps; tune 300–1000
opt.ttimeoutlen = 50 -- fast keycode timeout (ESC sequences)
opt.updatetime = 200

-- Tabs & indentation (global defaults)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Files
opt.fileformats = { "unix", "dos" }
opt.fileformat = "unix"

-- Misc
opt.mouse = "a"
opt.path:append("**")
opt.wildmenu = true

-- To Try
-- vim.o.confirm = true
opt.laststatus = 3
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true

-- Allow @ in file names
-- opt.isfname:append("@-@")
