return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {

					theme = {
						normal = {
							a = { bg = "None", gui = "bold" },
							b = { bg = "None", gui = "bold" },
							c = { bg = "None", gui = "bold" },
							x = { bg = "None", gui = "bold" },
							y = { bg = "None", gui = "bold" },
							z = { bg = "None", gui = "bold" },
						},
						insert = {
							a = { bg = "None", gui = "bold" },
							b = { bg = "None", gui = "bold" },
							c = { bg = "None", gui = "bold" },
							x = { bg = "None", gui = "bold" },
							y = { bg = "None", gui = "bold" },
							z = { bg = "None", gui = "bold" },
						},
						visual = {
							a = { bg = "None", gui = "bold" },
							b = { bg = "None", gui = "bold" },
							c = { bg = "None", gui = "bold" },
							x = { bg = "None", gui = "bold" },
							y = { bg = "None", gui = "bold" },
							z = { bg = "None", gui = "bold" },
						},
						replace = {
							a = { bg = "None", gui = "bold" },
							b = { bg = "None", gui = "bold" },
							c = { bg = "None", gui = "bold" },
							x = { bg = "None", gui = "bold" },
							y = { bg = "None", gui = "bold" },
							z = { bg = "None", gui = "bold" },
						},
						command = {
							a = { bg = "None", gui = "bold" },
							b = { bg = "None", gui = "bold" },
							c = { bg = "None", gui = "bold" },
							x = { bg = "None", gui = "bold" },
							y = { bg = "None", gui = "bold" },
							z = { bg = "None", gui = "bold" },
						},
						inactive = {
							a = { bg = "None", gui = "bold" },
							b = { bg = "None", gui = "bold" },
							c = { bg = "None", gui = "bold" },
							x = { bg = "None", gui = "bold" },
							y = { bg = "None", gui = "bold" },
							z = { bg = "None", gui = "bold" },
						},
					},
					icons_enabled = true,
					-- theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
