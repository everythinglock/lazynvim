-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- stylua: ignore
local keymaps = {
  -- Add undo break-points
  { "i", ",", ",<c-g>u" },
  { "i", ".", ".<c-g>u" },
  { "i", ";", ";<c-g>u" },
  { "i", "。", "。<c-g>u" },
  { "i", "，", "，<c-g>u" },
  { "i", "；", "；<c-g>u" },

  -- Insert mode movement
  { { "i", "c" }, "<C-h>", "<left>", "left", noremap = true },
  { { "i", "c" }, "<C-l>", "<right>", "right", noremap = true },
  { { "i" }, "<C-k>", "<up>", "up", noremap = true },
  { { "i" }, "<C-j>", "<down>", "down", noremap = true },
  { { "i", "c" }, "<C-e>", "<end>", "end" },
  { { "i", "c" }, "<C-a>", "<home>", "home" },

  -- del
  { "i", "<C-i>", "<backspace>", "Backspace", noremap = true },
  { "i", "<C-d>", "<delete>", "Delete", noremap = true },

  -- Escape
  { { "i", "v", "s", "n" }, ";j", "<ESC>", "ESCAPE" },
  { "t", ";j", "<C-\\><C-n>", "ESCAPE" },
  { "c", ";j", "<C-c>", "ESCAPE" },

  -- snacks terminal
  { { "n", "t" }, "<c-/>", function() Snacks.terminal('fish') end, desc = "Toggle Terminal", noremap = true },
  { { "n", "t" }, "<c-\\>", function() Snacks.terminal() end, desc = "Toggle Terminal", noremap = true },

}

-- Apply all keymaps
for _, keymap in ipairs(keymaps) do
  local mode, lhs, rhs = keymap[1], keymap[2], keymap[3]
  local opts = {}

  -- 收集键值对形式的选项
  for k, v in pairs(keymap) do
    if type(k) == "string" then
      opts[k] = v
    elseif k == 4 then
      opts.desc = v
    end
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end
