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
  local current = vim.api.nvim_get_current_buf()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  table.sort(buffers, function(a, b)
    return a.lastused > b.lastused
  end)
  local items = {}
  for _, buf in ipairs(buffers) do
    if buf.bufnr ~= current then
      local name = buf.name ~= "" and vim.fn.fnamemodify(buf.name, ":~:.")
        or ("[No Name " .. buf.bufnr .. "]")
      table.insert(items, { text = name, bufnr = buf.bufnr })
    end
  end
  MiniPick.start({
    source = {
      name = "Buffers (MRU)",
      items = items,
      choose = function(item)
        vim.schedule(function()
          vim.api.nvim_set_current_buf(item.bufnr)
        end)
      end,
    },
  })
end, { desc = "Pick buffers (MRU)" })

vim.keymap.set("n", "<leader>\\", function()
  MiniPick.builtin.grep_live()
end, { desc = "Grep live" })
