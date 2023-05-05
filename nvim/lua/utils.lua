local M = {}

function M.is_windows()
	return (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1) and vim.fn.has("wsl") == 0
end

M.icons = {
	error = "",
	warning = "",
	info = "",
	bulb = "",
	bug = "",
	clock = "",
}

return M
