local palette = {
  bg = "#1a1b26",
  surface = "#24283b",
  overlay = "#565f89",
  muted = "#9aa5ce",
  fg = "#c0caf5",
  blue = "#7aa2f7",
  green = "#9ece6a",
  yellow = "#e0af68",
  mauve = "#bb9af7",
  red = "#f7768e",
}

local function lualine_mode(accent)
  return {
    a = { bg = accent, fg = palette.bg, gui = "bold" },
    b = { bg = palette.surface, fg = palette.fg },
    c = { bg = palette.bg, fg = palette.muted },
  }
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      terminal_colors = true,
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        sidebars = "dark",
        floats = "dark",
      },
      on_highlights = function(hl)
        hl.WinSeparator = { fg = palette.surface }
        hl.CursorLineNr = { fg = palette.blue, bold = true }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = { color_icons = true, default = true },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      code = {
        sign = false,
      },
      heading = {
        sign = false,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local theme = {
        normal = lualine_mode(palette.blue),
        insert = lualine_mode(palette.green),
        visual = lualine_mode(palette.mauve),
        replace = lualine_mode(palette.red),
        command = lualine_mode(palette.yellow),
        terminal = lualine_mode(palette.green),
        inactive = {
          a = { bg = palette.bg, fg = palette.overlay },
          b = { bg = palette.bg, fg = palette.overlay },
          c = { bg = palette.bg, fg = palette.overlay },
        },
      }

      require("lualine").setup({
        options = {
          theme = theme,
          globalstatus = true,
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "lazy" } },
        },
        sections = {
          lualine_a = {
            { "mode", fmt = function(value) return value:sub(1, 3) end },
          },
          lualine_b = {
            { "branch", icon = "" },
            { "diff", symbols = { added = "+", modified = "~", removed = "-" } },
          },
          lualine_c = {
            { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" } },
          },
          lualine_x = {
            { "filetype", colored = false },
            {
              "diagnostics",
              symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
            },
          },
          lualine_y = {
            {
              "lsp_status",
              icon = "",
              symbols = { done = "✓", separator = " " },
            },
          },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "oil", "quickfix" },
      })
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 400,
      win = { border = "rounded" },
      spec = {
        { "<leader>b", group = "buffer" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>l", group = "lsp" },
        { "<leader>s", group = "split" },
      },
    },
  },
}
