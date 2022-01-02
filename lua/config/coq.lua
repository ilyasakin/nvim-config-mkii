local M = {}

function M.setup()
  vim.g.coq_settings = {
    auto_start = 'shut-up',
  }
end

return M
