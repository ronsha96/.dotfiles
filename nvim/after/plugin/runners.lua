local opts = { noremap = true }

-- Run
local overseer = require("overseer")

overseer.setup({
	-- strategy = "toggleterm",
	task_list = {
		default_detail = 2,
		min_width = { 60, 0.15 },
		direction = "right",
	},
})

vim.api.nvim_create_user_command("OverseerRestartLast", function()
	local tasks = overseer.list_tasks({ recent_first = true })
	if vim.tbl_isempty(tasks) then
		vim.notify("No tasks found", vim.log.levels.WARN)
	else
		overseer.run_action(tasks[1], "restart")
	end
end, {})

vim.keymap.set("n", "'xx", "<Cmd>OverseerRun<CR>", opts)
vim.keymap.set("n", "'xr", "<Cmd>OverseerRestartLast<CR>", opts)
vim.keymap.set("n", "'x'", "<Cmd>OverseerToggle<CR>", opts)
