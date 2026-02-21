return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-lua/plenary.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local telescope_builtin = require("telescope.builtin")

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			keymap.set("n", "gR", telescope_builtin.lsp_references, opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", telescope_builtin.lsp_type_definitions, opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", function() telescope_builtin.diagnostics({ bufnr = 0 }) end, opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "x ",
					[vim.diagnostic.severity.WARN] = "⚠ ",
					[vim.diagnostic.severity.HINT] = "? ",
					[vim.diagnostic.severity.INFO] = "i ",
				},
			},
		})

		-- configure typescript server with plugin
        vim.lsp.config("ts_ls", {
            on_attach = on_attach,
            capabilities = capabilities,
			filetypes = {
				"svelte",
				"typescript",
				"typescriptreact",
				"javascriptreact",
				"javascript",
				"html",
				"astro",
				"templ",
				"vue",
			},
        })

		-- configure tailwindcss server
        vim.lsp.config("tailwindcss", {
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "svelte", "typescriptreact", "javascriptreact", "js", "html", "astro", "templ", "vue" },
        })

        vim.lsp.config("intelephense", {
            on_attach = on_attach,
            capabilities = capabilities,
        })

        vim.lsp.config("biome", {})

        vim.lsp.config("pyrefly", {
            on_attach = on_attach,
            capabilities = capabilities,
        })

		vim.filetype.add({
			extension = {
				templ = "templ",
			},
		})

		lspconfig["templ"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "templ" },
		})

		lspconfig["intelephense"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["vuels"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.env.VIMRUNTIME .. "/lua"] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
