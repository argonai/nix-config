local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git", "node_modules", "target" },

		mappings = {
			i = {
				["<C-l>"] = actions.cycle_history_next,
				["<C-h>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<Down>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})

function findfirstpath(...)
	for _, path in ipairs({...}) do
		local found = vim.fn.finddir(path, ".;")
		if found ~= "" then
			return found
		end
		found = vim.fn.findfile(path, ".;")
		if found ~= "" then
			return found
		end
	end
end
function get_root()
	local dot_git_path = findfirstpath("build.sbt", "flake.nix", ".git", ".")
	return vim.fn.fnamemodify(dot_git_path, ":h")
end

function live_grep_from_project_root()
	local opts = {}
	opts = {
		cwd = get_root(),
	}
	require("telescope.builtin").live_grep(opts)
end

function find_files_from_project_root()
	local opts = {}
	opts = {
		cwd = get_root(),
	}
	require("telescope.builtin").find_files(opts)
end
