return {
	"L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
	config = function(_, opts)
    if opts then require("luasnip").config.setup(opts) end
    vim.tbl_map(
      function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
      { "vscode", "snipmate", "lua" }
    )
 end,
--	config = function()
--		require("luasnip.loaders.from_vscode").lazy_load()
--	end
}

