local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not ok then
    print("catppuccin not found")
    vim.cmd 'colorscheme default'
end
