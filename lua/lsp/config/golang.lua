local nvim_lsp = require("lspconfig")

local opts = {
	on_attach = function(client,bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr,...)
		end

		require("keymapping").mapLSP(buf_set_keymap)
		vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
	end,
    root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod','go.work'),
    cmd = { "gopls" },
    settings = {
        gopls = {
            completeUnimported =  true,
            usePlaceholders = true,
            analyses = {
                unusedpparams = true,
            },
        },
    },
}

return {
    on_setup = function()
        nvim_lsp.gopls.setup(opts)
    end,
}
