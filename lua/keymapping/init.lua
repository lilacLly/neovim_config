local map = vim.api.nvim_set_keymap
local pluginKeys = {}
local opt = {
	noremap = true,
	silent = true,
}

-- General
map("n", "<C-q>", ":Bdelete<CR>", opt)
map("n", "sv", ":vsp<CR>", opt)

-- Code Review
map("n", "<Space>", "za", opt)
map("n", "<C-m>", ":SymbolsOutline<CR>", opt)

-- BufferLine
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {})
map("n", "<Tab>", ":BufferLineCycleNext<CR>", {})

-- Telescope
map("n", "<Bslash>ff", ":Telescope find_files<CR>", {})
map("n", "<Bslash>fg", ":Telescope live_grep<CR>", {})

-- Lsp
local lsp_opt = {
	buffer = bufnr,
	noremap = true,
	silent = true,
}
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", lsp_opt)
	-- code action
	mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", lsp_opt)
	-- go xx
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", lsp_opt)
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", lsp_opt)
	mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", lsp_opt)
	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", lsp_opt)
	mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", lsp_opt)
	-- diagnostic
	mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", lsp_opt)
	mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", lsp_opt)
	mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", lsp_opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", lsp_opt)
end

-- Cmp
pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {

		-- 出现补全
		["<C-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<C-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

		-- 自定义代码段跳转到下一个参数
		["<C-l>"] = cmp.mapping(function(_)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			end
		end, { "i", "s" }),

		-- 自定义代码段跳转到上一个参数
		["<C-h>"] = cmp.mapping(function()
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),

		-- Super Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		-- end of super Tab
	}
end

return pluginKeys
