local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("没有找到 nvim-treesitter")
	return
end

treesitter.setup({
	ensure_installed = {
		"vim",
		"lua",
		"go",
		"python",
		"cpp",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
