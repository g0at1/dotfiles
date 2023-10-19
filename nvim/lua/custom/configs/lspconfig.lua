local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.jdtls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  file_types = { "java" },
  cmd = { "jdtls" },
  root_dir = util.root_pattern("pom.xml", "gradle.build", ".git"),
})

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  file_types = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

-- lspconfig.pyright.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   file_types = { "python" },
-- })

lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  file_types = { "python" },
})

lspconfig.phpactor.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  file_types = { "php" },
})

lspconfig.efm.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  file_types = { 'python', 'java', 'cpp' }
})



-- lspconfig.pyright.setup { blabla}
