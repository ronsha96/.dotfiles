local M = {}

function M.is_windows()
	return (vim.fn.has("win32") or vim.fn.has("win64")) and not vim.fn.has("wsl")
end

return M
