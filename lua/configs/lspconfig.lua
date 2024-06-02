-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = {
  {
    name = "html"
  },
  {
    name = "cssls"
  },
  {
    name = "gopls",
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          shadow = true,
          unusedvariable = true,
          useany = true,
        },
      },
    },
  },
  {
    name = "dockerls"
  },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp.name].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    cmd = lsp.cmd,
    filetypes = lsp.filetypes,
    root_dir = lsp.root_dir,
    settings = lsp.settings,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
