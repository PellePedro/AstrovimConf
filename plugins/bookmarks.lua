return {
	{
		"ChristianChiarulli/bookmark.nvim",
		dependencies = { "kkharji/sqlite.lua" },
		enabled = true,
		lazy = false,
		event = "BufRead",
		cmd = {
			"BookmarkToggle",
			"BookmarkNext",
			"BookmarkPrev",
			"BookmarkList",
			"FilemarkToggle",
			"FilemarkNext",
			"FilemarkPrev",
		},
		keys = {
    	{ "<leader>mm", "<cmd>BookmarkToggle<CR>", desc = "Toggle bookmark" },
    	{ "<leader>mf", "<cmd>FilemarkToggle<CR>", desc = "Toggle filemark" },
    	{ "<leader>mj", "<cmd>BookmarkPrev<CR>", desc = "Previous bookmark" },
    	{ "<leader>mk", "<cmd>BookmarkNext<CR>", desc = "Next bookmark" },
			{ "<leader>ma", "<cmd>BookmarkClearProject<CR>", desc = "Clear all bookmarks" },
    	{ "<leader>mc", "<cmd>BookmarkClear<CR>", desc = "Clear all bookmarks in file" },
    	{ "<leader>ml", "<cmd>BookmarkList<CR>", desc = "List bookmarks" },
    	{ "<leader>mb", "<cmd>Telescope bookmark filemarks<CR>", desc = "List bookmarks" },
    	{ "<leader>mt", "<cmd>Telescope bookmark filemarks<CR>", desc = "List filemarks" },
  	},
		opts = {
			sign = "",
			highlight = "Function",
			file_sign = "󱡅",
			file_highlight = "Function",
		},
		config = function()
			require("bookmark").setup(opts)
			require("telescope").load_extension "bookmark"
		end,
	},
}
