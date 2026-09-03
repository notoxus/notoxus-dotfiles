return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
    },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      delete_to_trash = false,
      skip_confirm_for_simple_edits = false,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      float = {
        padding = 2,
        max_width = 100,
        max_height = 32,
        border = "rounded",
      },
      win_options = {
        signcolumn = "no",
        wrap = false,
      },
    },
  },

  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
      { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
      { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Find buffers" },
      { "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent files" },
      { "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Find word under cursor" },
      { "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "Help tags" },
    },
    opts = {
      fzf_colors = true,
      winopts = {
        height = 0.85,
        width = 0.90,
        border = "rounded",
        preview = { layout = "horizontal", horizontal = "right:55%" },
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
    },
  },
}
