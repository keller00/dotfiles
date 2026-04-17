return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  ft = { 'rust' },
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        -- Override open_url to use local Nix docs when available
        open_url = function(url)
          local rustdocpath = vim.env.RUSTDOCPATH
          if rustdocpath and url:match("^https://doc%.rust%-lang%.org/") then
            local local_path = url:gsub("^https://doc%.rust%-lang%.org/", "file://" .. rustdocpath .. "/")
            vim.fn.jobstart({ "open", local_path }, { detach = true })
          else
            vim.fn.jobstart({ "open", url }, { detach = true })
          end
        end,
      },
    }
  end,
}
