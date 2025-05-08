return {
  "nvim-neorg/neorg",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>nn", "<CMD>Neorg journal today<CR>", desc = "Journal Today" },
    { "<leader>nt", "<CMD>Neorg journal tomorrow<CR>", desc = "Journal Tomorrow" },
    { "<leader>ny", "<CMD>Neorg journal yesterday<CR>", desc = "Journal Yesterday" },
    { "<leader>ni", "<CMD>Neorg index<CR>", desc = "Note Index" },
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.keybinds"] = {}, -- Adds default keybindings
        ["core.journal"] = {
          config = {
            strategy = "flat",
          },
        }, -- Enables support for the journal module
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Documents/notes",
              gtd = "~/Documents/gtd",
              journal = "~/Documents/journal",
            },
            default_workspace = "gtd",
          },
        },
      },
    })
  end,
}
