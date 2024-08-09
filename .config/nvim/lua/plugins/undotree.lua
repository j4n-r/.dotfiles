return {
	"mbbill/undotree",
	lazy = true,
	cmd = "UndotreeToggle",
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" }),
}
