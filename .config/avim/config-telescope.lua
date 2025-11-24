require('telescope').setup {
  pickers = {
    find_files = {
      find_command = { 
        "rg", 
        "--files", 
        "--hidden",           -- Show dotfiles
        "--glob", "!**/.git/*"   -- But exclude .git directory
      },
      -- rg respects .gitignore by default
    },
  },
}
