local nvim_lsp = require("lspconfig")

local opts = {
	on_attach = function(client,bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr,...)
		end

		require("keymapping").mapLSP(buf_set_keymap)
		vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
	end,
    -- capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod','go.work'),
    init_options = {
        usePlaceholders = false,
    },
	single_file_support = true,
}

return {
    on_setup = function()
        nvim_lsp.gopls.setup(opts)
    end,
}
