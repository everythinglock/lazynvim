return {
  "folke/which-key.nvim",
  optional = true,
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>a", group = "Ai" },
      { "<leader>n", group = "Notes/Notification" },
    },
  },
}
