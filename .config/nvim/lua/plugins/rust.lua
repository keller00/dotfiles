return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      tools = {
        -- Override to use local Nix docs when RUSTDOCPATH is set
        open_url = function(url)
          local rustdoc_path = vim.fn.getenv("RUSTDOCPATH")

          if rustdoc_path ~= vim.NIL and rustdoc_path ~= "" then
            local path = url:match("https://doc%.rust%-lang%.org/[^/]+/(.+)")
            if path then
              vim.fn.system({ "open", "file://" .. rustdoc_path .. "/" .. path })
              return
            end
          end

          vim.fn.system({ "open", url })
        end,
      },
    },
  },
}
