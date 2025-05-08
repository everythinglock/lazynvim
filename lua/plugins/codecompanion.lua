-- CodeCompanion.nvim configuration
-- Plugin: olimorris/codecompanion.nvim
-- Dependencies:
--   - nvim-lua/plenary.nvim
--   - nvim-treesitter/nvim-treesitter
--   - nvim-telescope/telescope.nvim
return {
  "olimorris/codecompanion.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
  -- Plugin configuration options
  opts = {
    opts = {
      language = "Chinese", -- Default language for responses
    },
    -- API adapter configurations
    adapters = {
      mn = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "https://api.mnapi.com/v1",
            api_key = vim.env.MN_API_KEY,
            chat_url = "/chat/completions",
          },
          schema = {
            model = {
              default = "deepseek-v3",
            },
          },
        })
      end,
      yw = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "https://yunwu.ai/v1",
            api_key = vim.env.YW_API_KEY,
            chat_url = "/chat/completions",
          },
          schema = {
            model = {
              default = "gemini-2.5-flash-preview-04-17",
            },
          },
        })
      end,
    },
    -- Default strategies for different operations
    strategies = {
      chat = { adapter = "yw" },
      inline = { adapter = "yw" },
      agent = { adapter = "yw" },
    },
  },
  -- Plugin setup function
  config = function(_, opts)
    require("codecompanion").setup(opts)
    -- Key mappings for CodeCompanion functionality
    -- stylua: ignore start
    vim.keymap.set("n", "<leader>ac", "<CMD>CodeCompanionChat Toggle<CR>", { desc = "Toggle", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>aa", "<CMD>CodeCompanionActions<CR>", { desc = "action", noremap = true, silent = true })
    vim.keymap.set("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.keymap.set("v", "<C-c>", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
    -- Command-line abbreviations for CodeCompanion
    vim.cmd([[cab cc CodeCompanion]])
    vim.cmd([[cab ccc CodeCompanionCmd]])
    vim.cmd([[cab cca CodeCompanionAction]])
    -- stylua: ignore end
  end,
}
