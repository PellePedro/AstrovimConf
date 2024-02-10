local utils = require("user.utils")
local astro_utils = require("astronvim.utils")
local mappings = {

	v = {
		["\\y"] = { [[<cmd>:OSCYankVisual<cr>]], desc = "OSC52 Copy" },
	},
	n = {
		-- alt leader
		["\\"] = "",
		["-"] = { "<cmd>Oil<cr>", desc = "Edit Files" },
		["\\1"] = { "<cmd>AerialToggle<cr>", desc = "Show Outline" },
		["\\2"] = { "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		["\\q"] = { [[<cmd>:Telescope aerial<CR>]], desc = "Telescope Symbols" },
		["\\r"] = { [[<cmd>lua vim.lsp.buf.rename()<cr>]], desc = "LSP Rename" },
		["\\s"] = {
			[[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>]],
			desc = "Search for",
		},
		["\\t"] = { [[<cmd>:TroubleToggle<cr>]], desc = "Troubles" },
		["\\w"] = {
			[[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<cr>]],
			desc = "Search <cword>",
		},
		["m"] = { desc = "  Bookmarks" },
		-- disable default bindings

		["<C-Down>"] = false,
		["<C-Left>"] = false,
		["<C-Right>"] = false,
		["<C-Up>"] = false,
		["<C-q>"] = false,
		["<C-s>"] = false,
		["q:"] = ":",
		-- better buffer navigation
		["]b"] = false,
		["[b"] = false,
		["<S-l>"] = {
			function()
				require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
			end,
			desc = "Next buffer",
		},
		["<S-h>"] = {
			function()
				require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
			end,
			desc = "Previous buffer",
		},
		-- better search
		n = { utils.better_search("n"), desc = "Next search" },
		N = { utils.better_search("N"), desc = "Previous search" },
		-- better increment/decrement
		["-"] = { "<c-x>", desc = "Descrement number" },
		["+"] = { "<c-a>", desc = "Increment number" },
		-- resize with arrows
		-- ["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
		-- ["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
		-- ["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
		-- ["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
		-- Easy-Align
		ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
		-- buffer switching
		["<Tab>"] = {
			function()
				if #vim.t.bufs > 1 then
					require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })
				else
					astro_utils.notify("No other buffers open")
				end
			end,
			desc = "Switch Buffers",
		},
		-- vim-sandwich
		["s"] = "<Nop>",
		["<leader>n"] = { "<cmd>new<cr>", desc = "New File" },
		["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
		["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
		["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
		-- neogen
		["<leader>a"] = { desc = "󰏫 Annotate" },
		["<leader>a<cr>"] = {
			function()
				require("neogen").generate()
			end,
			desc = "Current",
		},
		["<leader>ac"] = {
			function()
				require("neogen").generate({ type = "class" })
			end,
			desc = "Class",
		},
		["<leader>af"] = {
			function()
				require("neogen").generate({ type = "func" })
			end,
			desc = "Function",
		},
		["<leader>at"] = {
			function()
				require("neogen").generate({ type = "type" })
			end,
			desc = "Type",
		},
		["<leader>aF"] = {
			function()
				require("neogen").generate({ type = "file" })
			end,
			desc = "File",
		},
		-- telescope plugin mappings
		["<leader>fB"] = { "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
		["<leader>fe"] = { "<cmd>Oil<cr>", desc = "File explorer" },
		["<leader>fp"] = {
			function()
				require("telescope").extensions.projects.projects({})
			end,
			desc = "Find projects",
		},
		["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
		-- octo plugin mappings
		["<leader>G"] = { name = " GitHub" },
		["<leader>s"] = { desc = "󰛔 Search/Replace" },
		["<leader>ss"] = {
			function()
				require("spectre").open()
			end,
			desc = "Spectre",
		},
		["<leader>sf"] = {
			function()
				require("spectre").open_file_search()
			end,
			desc = "Spectre (current file)",
		},
		["<leader>sw"] = {
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Spectre (current word)",
		},
		["<leader>x"] = { desc = "󰒡 Trouble" },
		["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
		["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
		["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
		["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
		["<leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" },
		["<leader>;"] = { desc = "󰧑 AI Assistant" },
		["<leader>;;"] = {
			function()
				vim.cmd.Codeium(vim.g.codeium_enabled == 0 and "Enable" or "Disable")
				astro_utils.notify("Codeium " .. (vim.g.codeium_enabled == 0 and "Disabled" or "Enabled"))
			end,
			desc = "Toggle Global",
		},
		["<leader>;b"] = {
			function()
				vim.cmd.Codeium(vim.b.codeium_enabled == 0 and "EnableBuffer" or "DisableBuffer")
				astro_utils.notify("Codeium (buffer) " .. (vim.b.codeium_enabled == 0 and "Disabled" or "Enabled"))
			end,
			desc = "Toggle Buffer",
		},
	},
	v = {
		["<leader>r"] = { "<Plug>Send", desc = "Send to REPL" },
		["<leader>s"] = {
			function()
				require("spectre").open_visual()
			end,
			desc = "Spectre",
		},
	},
	i = {
		-- type template string
		["<C-CR>"] = { "<++>", desc = "Insert template string" },
		["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
		-- date/time input
		["<c-t>"] = { desc = "󰃰 Date/Time" },
		["<c-t>n"] = { "<c-r>=strftime('%Y-%m-%d')<cr>", desc = "Y-m-d" },
		["<c-t>x"] = { "<c-r>=strftime('%m/%d/%y')<cr>", desc = "m/d/y" },
		["<c-t>f"] = { "<c-r>=strftime('%B %d, %Y')<cr>", desc = "B d, Y" },
		["<c-t>X"] = { "<c-r>=strftime('%H:%M')<cr>", desc = "H:M" },
		["<c-t>F"] = { "<c-r>=strftime('%H:%M:%S')<cr>", desc = "H:M:S" },
		["<c-t>d"] = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", desc = "Y/m/d H:M:S -" },
	},
	-- terminal mappings
	t = {
		["<C-BS>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
		["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
	},
	x = {
		-- better increment/decrement
		["+"] = { "g<C-a>", desc = "Increment number" },
		["-"] = { "g<C-x>", desc = "Descrement number" },
		-- line text-objects
		["il"] = { "g_o^", desc = "Inside line text object" },
		["al"] = { "$o^", desc = "Around line text object" },
		-- Easy-Align
		ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
		-- vim-sandwich
		["s"] = "<Nop>",
	},
	o = {
		-- line text-objects
		["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
		["al"] = { ":normal val<cr>", desc = "Around line text object" },
	},
}

-- add more text objects for "in" and "around"
for _, char in ipairs({ "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" }) do
	for _, mode in ipairs({ "x", "o" }) do
		mappings[mode]["i" .. char] =
			{ string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char), desc = "between " .. char }
		mappings[mode]["a" .. char] =
			{ string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char), desc = "around " .. char }
	end
end

return mappings
