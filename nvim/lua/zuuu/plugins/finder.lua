vim.pack.add({ "https://github.com/nvim-mini/mini.pick" })

require("mini.pick").setup({
  mappings = {
    move_down = "<C-j>",
    move_up = "<C-k>",
  },
})

vim.keymap.set("n", "<leader>p", function()
  MiniPick.builtin.cli({
    command = {
      "rg",
      "--files",
      "--sort=path",
      "--hidden",
      "--follow",
      "--no-ignore-vcs",
      "--glob=!.git",
      "--color=never",
    },
  }, { source = { name = "Files" } })
end, { desc = "Pick files" })

vim.keymap.set("n", "<leader>P", function()
  MiniPick.builtin.buffers()
end, { desc = "Pick buffers" })
