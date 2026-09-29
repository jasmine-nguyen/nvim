return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.add({
			-- General
			{
				"<leader>a",
				"ggVG",
				desc = "select entire buffer",
				icon = "",
			},
			{ "<leader>q", "<cmd>:q<cr>", desc = "quit", icon = "󰈆" },
			{ "<leader>w", "<cmd>:w<cr>", desc = "save", icon = "" },
			{
				"<leader>Q",
				"<cmd>:q!<cr>",
				desc = "quit without saving",
				icon = "󰈆",
			},
			-- Buffer (<leader>b)
			{ "<leader>b", group = "buffer" },
			{ "<leader>bd", "<cmd>bd<cr>", desc = "close", icon = "󰅖" },
			{
				"<leader>bm",
				"<cmd>delmarks!<CR>",
				desc = "delete marks",
				icon = "",
			},
			-- Yank (<leader>y)
			{ "<leader>y", group = "yank" },
			{
				"<leader>yn",
				[[:let @+ = expand('%:t:r')<cr>:echo   "Yanked filename: " . expand('%:t:r')<cr>]],
				desc = "filename",
				icon = "",
			},
			{
				"<leader>yp",
				[[:let @+ = expand('%')<cr>:let @+ = substitute(@+, getcwd() . '/', '', '')<cr>:echo "Yanked filepath: " . @+<cr>]],
				desc = "filepath",
				icon = "",
			},
			-- Replace (<leader>r)
			{ "<leader>r", group = "replace" },
			{
				"<leader>rU",
				[[:%s/\<<C-r><C-w>\>/<C-r>=toupper(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
				desc = "UPPERCASE word under cursor",
				icon = " ",
			},
			{
				"<leader>rL",
				[[:%s/\<<C-r><C-w>\>/<C-r>=tolower(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
				desc = "lowercase word under cursor",
				icon = " ",
			},
			-- LSP (<leader>l)
			{ "<leader>l", group = "lsp" },
			{ "gd", vim.lsp.buf.definition, desc = "lsp - definition", icon = "" },
			{ "gD", vim.lsp.buf.declaration, desc = "lsp - declaration", icon = "" },
			{ "<leader>lf", vim.lsp.buf.format, desc = "format", icon = "" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "rename", icon = "" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "code action", icon = "" },
			{ "<leader>ld", vim.diagnostic.open_float, desc = "diagnostics (float)", icon = "" },
			{
				"<leader>lj",
				function()
					vim.diagnostic.jump({ count = 1, float = true })
				end,
				desc = "next diagnostic",
				icon = "",
			},
			{
				"<leader>lk",
				function()
					vim.diagnostic.jump({ count = -1, float = true })
				end,
				desc = "prev diagnostic",
				icon = "",
			},
			-- -- SFDX
			-- { "<leader>ss", require("sf").set_target_org, desc = "set target org", icon = "" },
			-- { "<leader>sp", require("sf").save_and_push, desc = "push current file", icon = "" },
			-- { "<leader>sr", require("sf").retrieve, desc = "retrieve current file", icon = "" },
			-- { "<leader>sc", require("sf").copy_apex_name, desc = "copy apex name", icon = "" },
			-- Git (<leader>g)
			{ "<leader>g", group = "git" },
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "lazygit",
				icon = "",
			},
			{
				"<leader>gb",
				function()
					Snacks.git.blame_line()
				end,
				desc = "blame line",
				icon = "",
			},
			{ "<leader>gd", desc = "diff view" },
			{ "<leader>gh", desc = "file history" },
			{ "<leader>gH", desc = "branch history" },
			-- Find / Picker (<leader>f)
			{ "<leader>f", group = "find" },
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "files",
				icon = "",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "text (grep)",
				icon = "",
			},
			{
				"<leader>fw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "word under cursor",
				icon = "",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "open buffers",
				icon = "",
			},
			{
				"<leader>fe",
				function()
					Snacks.picker.explorer()
				end,
				desc = "explorer",
				icon = "󰙅",
			},
			{
				"<leader>fl",
				function()
					Snacks.picker.lines()
				end,
				desc = "line in buffer",
			},
			{
				"<leader>fs",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "symbol in file",
			},
			{
				"<leader>fS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "symbol in workspace",
			},
			{
				"<leader>fm",
				function()
					Snacks.picker.marks()
				end,
				desc = "marks",
				icon = "",
			},
			{
				"<leader>fi",
				function()
					Snacks.picker.icons()
				end,
				desc = "icons",
				icon = "",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.todo_comments()
				end,
				desc = "todo comments",
				icon = "",
			},
			{
				"<leader>fd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "diagnostics",
				icon = "",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.resume()
				end,
				desc = "resume last picker",
				icon = "",
			},
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "toggle zen mode",
				icon = "󰶟",
			},
			-- Split (<leader>s)
			{ "<leader>s", group = "split" },
			{ "<leader>sv", "<C-w>v", desc = "vertical", icon = "" },
			{ "<leader>sh", "<C-w>s", desc = "horizontal", icon = "" },
			{ "<leader>se", "<C-w>=", desc = "equalize", icon = "" },
			{ "<leader>sx", "<cmd>close<CR>", desc = "close", icon = "" },
			-- Tabs & terminal (<leader>t)
			{ "<leader>t", group = "tab/terminal" },
			{
				"<leader>tt",
				function()
					Snacks.terminal.toggle()
				end,
				desc = "toggle terminal",
				icon = "",
			},
			{ "<leader>to", "<cmd>tabnew<CR>", desc = "new tab", icon = " " },
			{ "<leader>tx", "<cmd>tabclose<CR>", desc = "close tab", icon = " " },
			{ "<leader>tn", "<cmd>tabn<CR>", desc = "next tab", icon = " " },
			{ "<leader>tp", "<cmd>tabp<CR>", desc = "prev tab", icon = " " },
		})
	end,
}
