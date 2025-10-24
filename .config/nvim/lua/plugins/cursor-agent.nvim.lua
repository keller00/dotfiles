return {
  "keller00/cursor-agent.nvim",
  config = function()
    vim.keymap.set("n", "<leader>a", ":CursorAgent<CR>", { desc = "Cursor Agent: Toggle terminal" })
    vim.keymap.set("v", "<leader>a", ":CursorAgentSelection<CR>", { desc = "Cursor Agent: Send selection" })
    vim.keymap.set("n", "<leader>A", ":CursorAgentBuffer<CR>", { desc = "Cursor Agent: Send buffer" })
  end,
}
