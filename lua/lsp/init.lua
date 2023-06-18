local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
  return
end

local ensure_servers = {
    "gopls", "lua_ls", "pyright",
}

mason_lspconfig.setup {
    ensure_installed = ensure_servers
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities
        }
    end,
    ["gopls"] = function ()
        require("lsp/config/golang").on_setup()
    end,
    ["lua_ls"] = function ()
        require("lsp/config/lua").on_setup()
    end
}

require("lsp/cmp")
require("lsp/ui")
require("lsp/null-ls")

vim.notify("lsp setup finished.")
