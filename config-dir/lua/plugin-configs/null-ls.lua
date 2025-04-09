local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local denylist = {
  ts_ls = true,
  stylelint_lsp = true,
  html = true,
  cssls = true,
}

local denylist_by_filetype = {
  lua = {
    sumneko_lua = true,
  },
  markdown = {
    html = true,
    ["null-ls"] = true,
  },
}

local function get_filter(bufnr)
  return function(client)
    if denylist[client.name] then
      return false
    end

    local filetype = vim.api.nvim_buf_get_option(bufnr or 0, "filetype")
    local denylist_for_filetype = denylist_by_filetype[filetype]
    if not denylist_for_filetype then
      return true
    end

    return not denylist_for_filetype[client.name]
  end
end

local function format(options)
  options = options or {}
  options.bufnr = options.bufnr or vim.api.nvim_get_current_buf()
  options.filter = get_filter(options.bufnr)
  vim.lsp.buf.format(options)
end

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})
