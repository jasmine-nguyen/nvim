-- Run from the config directory: nvim --headless -u NONE -l tests/apex_lsp.lua
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/nvim-lspconfig")
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/blink.cmp")
assert(loadfile("lua/plugins/lsp.lua"))()[2].config()

local config = vim.lsp.config.apex_ls
local filereadable, root = vim.fn.filereadable, vim.fs.root
local readable, project = 0, "/test/project"
local selected_root
vim.fn.filereadable = function(path)
	assert(path == config.apex_jar_path)
	return readable
end
vim.fs.root = function(_, markers)
	assert(vim.deep_equal(markers, { "sfdx-project.json" }))
	return project
end
local function select_root(path)
	selected_root = path
end

config.root_dir(0, select_root)
assert(selected_root == nil, "Missing JAR must not start Apex")
readable = 1
config.root_dir(0, select_root)
assert(selected_root == project, "Installed JAR must allow Apex in a Salesforce project")
selected_root, project = nil, nil
config.root_dir(0, select_root)
assert(selected_root == nil, "Apex must not start outside a Salesforce project")

vim.fn.filereadable, vim.fs.root = filereadable, root
print("PASS: Apex startup waits for installation and requires a Salesforce project")
