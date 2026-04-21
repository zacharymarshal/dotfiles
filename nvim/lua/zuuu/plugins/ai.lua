vim.pack.add({ "https://github.com/zbirenbaum/copilot.lua" })

require("copilot").setup({
  panel = { enabled = false },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-J>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
})
