return {
	"elixir-tools/elixir-tools.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local elixir = require("elixir")
		local elixirls = require("elixir.elixirls")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		elixir.setup({
			nextls = { enable = false },
			elixirls = {
				enable = true,
				settings = elixirls.settings({
					dialyzerEnabled = false,
					enableTestLenses = false,
				}),
				on_attach = function(client, bufnr)
					vim.keymap.set(
						"n",
						"<space>mfp",
						":ElixirFromPipe<cr>",
						{ desc = "Refactor elixir from pipe", buffer = true, noremap = true }
					)
					vim.keymap.set(
						"n",
						"<space>mtp",
						":ElixirToPipe<cr>",
						{ desc = "Refactor elixir to pipe", buffer = true, noremap = true }
					)
					vim.keymap.set(
						"v",
						"<space>mem",
						":ElixirExpandMacro<cr>",
						{ desc = "Refactor elixir expand macro", buffer = true, noremap = true }
					)
				end,
			},
			projectionist = {
				enable = true,
			},
			capabilities = capabilities,
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
