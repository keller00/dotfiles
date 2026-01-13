vim.g.autoformat = false
if vim.env.TERM == "xterm-ghostty" and vim.env.CWS == "true" then
  vim.opt.clipboard = 'unnamedplus'
  vim.g.clipboard = 'osc52'
end
