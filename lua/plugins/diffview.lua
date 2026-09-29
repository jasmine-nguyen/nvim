return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "diff view" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "file history" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "branch history" },
	},
	opts = {
		use_icons = false,
		view = {
			merge_tool = {
				layout = "diff3_mixed",
			},
		},
		keymaps = {
			view = {
				{ "n", "q", "<cmd>DiffviewClose<cr>" },
			},
			file_panel = {
				{ "n", "q", "<cmd>DiffviewClose<cr>" },
			},
			file_history_panel = {
				{ "n", "q", "<cmd>DiffviewClose<cr>" },
			},
		},
	},
}
