local jdtls = require("jdtls")
local config = {
	cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upwards = true })[1]),
}
jdtls.start_or_attach(config)

local keymap = vim.keymap -- for conciseness

local opts = { noremap = true, silent = true }

opts.desc = "Go to definition (JDTLS)"
keymap.set("n", "jd", vim.lsp.buf.definition, opts) -- show lsp definitions
opts.desc = "Organize imports (JDTLS)"
keymap.set("n", "jo", jdtls.organize_imports, opts) -- show lsp definitions
opts.desc = "Extract variable (JDTLS)"
keymap.set("n", "jev", jdtls.extract_variable, opts) -- show lsp definitions
opts.desc = "Extract constant (JDTLS)"
keymap.set("n", "jec", jdtls.extract_constant, opts) -- show lsp definitions
opts.desc = "Extract method (JDTLS)"
keymap.set("n", "jem", jdtls.extract_method, opts) -- show lsp definitions
