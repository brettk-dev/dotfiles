require('plugins')
require('gruvbox-config')
require('nvim-cmp-config')
require('null-ls-config')

vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			vim.lsp.buf.formatting_sync()
		end,
		desc = "Format with LSP on save.",
	})

vim.wo.number = true
vim.opt.scrolloff = 10
