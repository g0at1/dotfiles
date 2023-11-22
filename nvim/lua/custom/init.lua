local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })



autocmd("FileType", {
  pattern = "norg",
  callback = function ()
    opt.number = false
    opt.showtabline = 0
    opt.cole = 1
    opt.foldlevel = 10
  end,
})

vim.g.copilot_assume_mapped = true



