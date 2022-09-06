local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
  return
end

local ensure_servers = {
    "gopls", "lua-language-server"
}

mason_lspconfig.setup {
    ensure_installed = ensure_servers
}

mason_lspconfig.setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
    ["gopls"] = function ()
        require("lsp/config/golang").on_setup()
    end,
    ["sumneko_lua"] = function ()
        require("lsp/config/lua").on_setup()
    end
}

vim.notify("lsp setup finished.")
