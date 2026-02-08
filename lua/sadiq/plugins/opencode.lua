
return {
	"nickjvandyke/opencode.nvim",
	dependencies = {
		-- Required for `ask()`, `select()`, and `snacks` provider.
		---@module 'snacks'
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		-- Keymaps using <leader>o prefix to avoid conflicts.
		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode…" })

		vim.keymap.set({ "n", "x" }, "<leader>ox", function()
			require("opencode").select()
		end, { desc = "Execute opencode action…" })

		vim.keymap.set({ "n", "t" }, "<leader>oo", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })

		vim.keymap.set({ "n", "x" }, "<leader>or", function()
			return require("opencode").operator("@this ")
		end, { desc = "Add range to opencode", expr = true })

		vim.keymap.set("n", "<leader>ol", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Add line to opencode", expr = true })

		vim.keymap.set("n", "<leader>ou", function()
			require("opencode").command("session.half.page.up")
		end, { desc = "Scroll opencode up" })

		vim.keymap.set("n", "<leader>od", function()
			require("opencode").command("session.half.page.down")
		end, { desc = "Scroll opencode down" })
	end,
}
