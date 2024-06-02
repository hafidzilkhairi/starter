return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",

        -- golang
        "gopls", "delve", "golangci-lint",
        "gospel", "staticcheck", "gofumpt",
        "gofumpt", "goimports", "goimports-reviser",
        "golines", "gomodifytags", "gotests",

        -- docker
        "dockerfile-language-server"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css",

        -- go
        "go", "gomod", "gosum",

        -- json
        "json"
  		},
  	},
  },

  {
    "nvimtools/none-ls.nvim",
    ft = "go",
    opts = function ()
      return require "configs.null-ls"
    end
  },
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text"
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local nvchadNvimTreeCfg = require "nvchad.configs.nvimtree"
      local myNvimTreeCfg = require "configs.nvim-tree"
      return vim.tbl_deep_extend("force", nvchadNvimTreeCfg, myNvimTreeCfg)
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  }
}
