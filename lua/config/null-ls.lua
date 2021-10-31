require("null-ls").config({
	-- you must define at least one source for the plugin to work
	sources = { require("null-ls").builtins.formatting.stylua },
})

require("lspconfig")["null-ls"].setup({})
