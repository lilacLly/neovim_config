local ok, symbols_outline = pcall(require, 'symbols-outline')
if not ok then
    vim.notify("plugin symbols-outline not found!")
    return
end

symbols_outline.setup {}
