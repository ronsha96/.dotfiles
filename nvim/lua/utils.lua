function is_windows()
	if vim.fn.has("win32") or vim.fn.has("win64") then
		return true
	else
		return false
	end
end
