local lspconfig = require('lspconfig')

local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true });
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local custom_attach = function(client)
  if client.name == "angularls" then
      client.server_capabilities.renameProvider = false
  end

  map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n','td','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
  map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n','<leader>=', '<cmd>lua vim.lsp.buf.format()<CR>')
  map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
}

lspconfig.eslint.setup{
  capabilities = capabilities,
  on_attach = custom_attach,
}

lspconfig.html.setup{
  capabilities = capabilities,
  on_attach = custom_attach,
}

lspconfig.stylelint_lsp.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
  filetypes = {
    'css',
    'less',
    'scss',
    'sass'
  },
}

lspconfig.yamlls.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
  settings = {
    yaml = {
      keyOrdering = false
    }
  },
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
  filetypes = {
    'css',
    'less',
    'scss',
    'sass'
  },
}

lspconfig.dockerls.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
}

lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
}

lspconfig.phpactor.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
}

lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
}

local node_path = os.getenv("LOCAL_NODE_PATH");

local project_library_path = node_path .. "\\node_modules\\"
local cmd = {
  node_path .. "\\ngserver.cmd", "--stdio",
  "--tsProbeLocations", project_library_path,
  "--ngProbeLocations", project_library_path,
  "--forceStrictTemplates", "",
}

lspconfig.angularls.setup {
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
  capabilities = capabilities,
  on_attach = custom_attach,
  root_dir = function(fname)
    return vim.loop.cwd()
  end,
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end,
}
