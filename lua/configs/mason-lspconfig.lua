local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
  return
end

mason_lspconfig.setup {}
