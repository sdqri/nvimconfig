local Plugin = { "nvim-telescope/telescope.nvim" }

Plugin.dependencies = {
  { "nvim-telescope/telescope-live-grep-args.nvim" }
}

Plugin.opts = {
  extensions = {
    live_grep_args = {},
  },
}

Plugin.keys = {
  { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
  { "<leader>fg", function() require("telescope").extensions.live_grep_args.live_grep_args() end, desc = "Live Grep Args" },
  { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
  { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find Help Tags" },
}

return Plugin

