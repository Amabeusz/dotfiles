return {
	"williamboman/mason.nvim",
	opts = function(_, opts)
		opts.ensure_installed = opts.ensure_installed or {}
		vim.list_extend(opts.ensure_installed, {
			"gopls",
			"goimports",
			"gofumpt",
			"gomodifytags",
			"impl",
			"delve"
		})
	end,
	config = function()
		require("mason").setup()
	end
}
