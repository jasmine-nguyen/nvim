return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		enabled = true,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				float = { transparent = true },
				integrations = {
					blink_cmp = true,
					dap = true,
					flash = true,
					fzf = true,
					mason = true,
					mini = { enabled = true, indentscope_color = "" },
					neotree = true,
					render_markdown = true,
					snacks = { enabled = true },
					treesitter = true,
					ufo = true,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
