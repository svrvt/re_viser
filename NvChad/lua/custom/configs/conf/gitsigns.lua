local gitsigns = require "gitsigns"

gitsigns.setup {
-- local options = {
  signs = {
    add          = {  hl = "GitSignsAdd",     text = '▎', numhl = "GitSignsAddNr",    linehl = "GitSignsAddLn"    },
    change       = {  hl = "GitSignsChange",  text = '▎', numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete       = {  hl = "GitSignsDelete",  text = '契', numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete    = {  hl = "GitSignsDelete",  text = '契', numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = {  hl = "GitSignsChange",  text = '▎', numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    untracked    = { text = '┆' },
  },
  on_attach = function(bufnr)
    vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr })
    vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { buffer = bufnr })
    vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr })
    vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr })
    vim.keymap.set("n", "<leader>hj", gitsigns.next_hunk, { buffer = bufnr })
    vim.keymap.set("n", "<leader>hk", gitsigns.prev_hunk, { buffer = bufnr })
  end,

  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  trouble = false,
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  -- current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 10000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
-- return options