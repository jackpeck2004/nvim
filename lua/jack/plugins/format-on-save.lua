return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				vue = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		opts.desc = "Format (Sync)"
		keymap.set("n", "<leader>ff", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end) -- mapping to format file

		-- vim.api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end,
}

-- return {
--     "elentok/format-on-save.nvim",
--     config = function()
--         local format_on_save = require('format-on-save')
--         local formatters = require('format-on-save.formatters')
--         format_on_save.setup({
--             exclude_path_patterns = {
--                 "/node_modules/",
--                 ".local/share/nvim/lazy",
--                 "/vendor",
--             },
--             formatter_by_ft = {
--                 css = formatters.lsp,
--                 html = formatters.lsp,
--                 java = formatters.lsp,
--                 javascript = formatters.lsp,
--                 json = formatters.lsp,
--                 lua = formatters.lsp,
--                 markdown = formatters.prettierd,
--                 openscad = formatters.lsp,
--                 python = formatters.black,
--                 rust = formatters.lsp,
--                 scad = formatters.lsp,
--                 scss = formatters.lsp,
--                 sh = formatters.shfmt,
--                 terraform = formatters.lsp,
--                 typescript = formatters.prettierd,
--                 typescriptreact = formatters.prettierd,
--                 yaml = formatters.lsp,
--                 vue = formatters.prettierd,
--
--             },
--             fallback_formatter = {
--                 formatters.remove_trailing_whitespace,
--                 formatters.remove_trailing_newlines,
--                 formatters.lsp,
--             },
--         })
--     end
-- }
