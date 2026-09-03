return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
          },
        },
      })

      local servers = {
        bashls = "bash-language-server",
        lua_ls = "lua-language-server",
        nixd = "nixd",
      }

      for name, executable in pairs(servers) do
        if vim.fn.executable(executable) == 1 then
          vim.lsp.enable(name)
        end
      end

      local lsp_group = vim.api.nvim_create_augroup("notoxus-lsp", { clear = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = lsp_group,
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gr", vim.lsp.buf.references, "Go to references")
          map("n", "gI", vim.lsp.buf.implementation, "Go to implementation")
          map("n", "K", vim.lsp.buf.hover, "Hover documentation")
          map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
          map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, "Format buffer")
          map("n", "<leader>li", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
          end, "Toggle inlay hints")

          if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          end
        end,
      })

      vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, { desc = "Next diagnostic" })
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Line diagnostics" })
      vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

      vim.keymap.set("i", "<C-Space>", function()
        vim.lsp.completion.get()
      end, { desc = "Trigger completion" })

      vim.keymap.set("i", "<CR>", function()
        return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
      end, { expr = true, desc = "Accept completion" })

      vim.keymap.set("i", "<Tab>", function()
        if vim.fn.pumvisible() == 1 then return "<C-n>" end
        if vim.snippet.active({ direction = 1 }) then
          vim.snippet.jump(1)
          return ""
        end
        return "<Tab>"
      end, { expr = true, desc = "Next completion or snippet field" })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if vim.fn.pumvisible() == 1 then return "<C-p>" end
        if vim.snippet.active({ direction = -1 }) then
          vim.snippet.jump(-1)
          return ""
        end
        return "<S-Tab>"
      end, { expr = true, desc = "Previous completion or snippet field" })
    end,
  },
}
