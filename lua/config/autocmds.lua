-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Live reload: watch files of loaded buffers and reload them when changed on disk
-- (e.g. edited by Claude Code / Codex). Buffers with unsaved edits are not overwritten silently.
local uv = vim.uv or vim.loop
local watchers = {} -- bufnr -> fs_event handle

local function stop_watch(buf)
  local w = watchers[buf]
  if w then
    if not w:is_closing() then
      w:stop()
      w:close()
    end
    watchers[buf] = nil
  end
end

local function start_watch(buf)
  stop_watch(buf)
  if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].buftype ~= "" then
    return
  end
  local path = vim.api.nvim_buf_get_name(buf)
  if path == "" or not uv.fs_stat(path) then
    return
  end
  local w = uv.new_fs_event()
  if not w then
    return
  end
  watchers[buf] = w
  w:start(path, {}, function()
    -- Atomic writes (write temp + rename) invalidate the watch, so re-arm it after each event.
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(buf) then
        vim.cmd("silent! checktime " .. buf)
        start_watch(buf)
      end
    end)
  end)
end

local group = vim.api.nvim_create_augroup("live_reload", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "BufNewFile" }, {
  group = group,
  callback = function(ev)
    start_watch(ev.buf)
  end,
})
vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
  group = group,
  callback = function(ev)
    stop_watch(ev.buf)
  end,
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = group,
  callback = function(ev)
    vim.notify("Reloaded: " .. vim.fn.fnamemodify(ev.file, ":~:."), vim.log.levels.INFO)
  end,
})
