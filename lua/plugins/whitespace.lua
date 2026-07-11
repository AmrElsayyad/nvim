return {
  "ntpeters/vim-better-whitespace",
  event = "BufRead",
  init = function()
    vim.g.strip_whitespace_on_save = 1
    vim.g.strip_whitespace_confirm = 0
    vim.g.strip_max_file_size = 0
    vim.g.better_whitespace_filetypes_blacklist = {
      "diff", "git", "gitcommit", "unite", "qf", "help", "markdown", "fugitive",
    }
  end,
}
