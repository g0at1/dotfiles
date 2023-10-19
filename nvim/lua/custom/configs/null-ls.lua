local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Go 
  b.formatting.goimports,
  b.formatting.gofumpt,
  b.formatting.golines,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

}


null_ls.setup {
  debug = true,
  sources = sources,
}


