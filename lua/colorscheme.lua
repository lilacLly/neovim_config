local colorscheme = "solarized8"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

-- local colorscheme = "solarized"
-- local ok, colorscheme = pcall(require, colorscheme)
-- if not ok then
--     vim.notify("colorscheme " .. colorscheme .. " not found!")
--     return
-- end
-- vim.g.solarized_italic_comments = true
-- vim.g.solarized_italic_keywords = true
-- vim.g.solarized_italic_functions = true
-- vim.g.solarized_italic_variables = false
-- vim.g.solarized_contrast = true
-- vim.g.solarized_borders = false
-- vim.g.solarized_disable_background = false
-- 
-- colorscheme.set {}
