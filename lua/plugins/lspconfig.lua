return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(client, bufnr)
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

			--	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workleader_folder(), bufopts)
			--	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workleader_folder(), bufopts)
			-- 	vim.keymap.set('n', '<leader>wl', print(vim.inspect(vim.lsp.buf.list_workleader_folders())), bufopts)
			vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set('n', '<leader>e', vim.lsp.diagnostic.show_line_diagnostics, bufopts)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev(), bufopts)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next(), bufopts)
			vim.keymap.set('n', '<leader>q', vim.lsp.diagnostic.set_loclist, bufopts)
			vim.keymap.set('n', 'gO', require("man").show_toc(), bufopts)
			--{ "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
			--	vim.keymap.set('n', "<leader>td", require("dap-go").debug_test(), bufopts)
		end

		lspconfig.gopls.setup {
			cmd = { 'gopls' },
			settings = {
				gopls = {
					experimentalPostfixCompletions = true,
					analyses = {
						unusedparams = true,
						shadow = true,
					},
					staticcheck = true,
				},
			},
			on_attach = on_attach,
		}
		lspconfig.lua_ls.setup {
			on_attach = on_attach,
		}
		lspconfig.clangd.setup {
			cmd = { 'clangd' },
			--cmd = {'clangd --check=\'V:\\dev\\c\\task-management\\todo.c'},
			on_attach = on_attach
		}
		lspconfig.tsserver.setup {}
		lspconfig.jdtls.setup {}
	--	lspconfig.html.setup {
	--		capabilities = {
	--			textDocument = {
	--				completion = {
	--					completionItem ={
	--						snippetSupport = true
	--					}
	--				}
	--			}
	--		},
	--		configurationSection = { "html", "css", "javascript" },
	--		embeddedLanguages = {
	--			css = true,
	--			javascript = true
	--		},
	--		provideFormatter = true
	--	}
	end
}
