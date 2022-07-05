local null_ls = require('null-ls')

null_ls.setup({
    on_attach = function(client, bufnr)
      if client.name == 'tsserver' then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
      end
    end,

    sources = {
      null_ls.builtins.formatting.prettier,
    }
  })
