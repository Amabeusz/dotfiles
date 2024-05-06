return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufopts = { noremap=true, silent=true, buffer=bufnr }

		-- Lua
		vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
		vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
	end,
}
