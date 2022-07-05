-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'volar' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- Configure Volar
require'lspconfig'.volar.setup{
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  init_options = {
    typescript = {
      serverPath = '/home/brettk/.volta/tools/image/packages/typescript/lib/node_modules/typescript/lib/tsserverlibrary.js'
    }
  }
}

-- Configure Typescript
require'lspconfig'.tsserver.setup{
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior =
        cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] =
      cmp.mapping(function(fallback)
        if
          cmp.visible()
          then
          cmp.select_next_item()
        elseif
          luasnip.expand_or_jumpable()
          then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      {
        'i',
        's'
      }),
    ['<S-Tab>']
    =
    cmp.mapping(function(fallback)
      if
        cmp.visible()
        then
        cmp.select_prev_item()
      elseif
        luasnip.jumpable(-1)
        then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
    {
      'i',
      's'
    }),
  }),
  sources =
  {
    {
      name = 'nvim_lsp'
    },
    {
      name = 'luasnip'
    },
  },
}
