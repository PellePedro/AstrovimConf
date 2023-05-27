return {
	{
		"ChristianChiarulli/bookmark.nvim",
		dependencies = { "kkharji/sqlite.lua" },
		enabled = false,
		lazy = false,
		event = "BufRead",
		cmd = {
			"BookmarkToggle",
			"BookmarkNext",
			"BookmarkPrev",
			"BookmarkList",
			"FileMarkToggle",
			"FileMarkNext",
			"FileMarkPrev",
		},
		keys = { "<leader>bm" },
		config = function()
			require("bookmark").setup({
				sign = "",
				highlight = "Function",
				file_sign = "󱡅",
				file_highlight = "Function",
			})
		end,
	},
}
