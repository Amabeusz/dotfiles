--return {
--	"folke/tokyonight.nvim",
--	lazy = false,
--	priority = 1000,
--	config = function()
--		vim.cmd([[colorscheme tokyonight-night]])
--	end,
--}

return {
	"rebelot/kanagawa.nvim",
	config = function()
		vim.cmd([[colorscheme kanagawa-dragon]])
	end
}
